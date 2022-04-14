//
//  MiniGame2B.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/17.
//

import SwiftUI
import Combine
import AVFoundation

class alphabet:ObservableObject{
    @Published var pos = [CGRect]()
    @Published var correct = [Bool]()
}

struct MiniGame2B: View {
    // MARK: - 변수
    @State private var vocaVM = MiniGame2BVM() // ViewModel MiniGame2BVM()를 사용하는 변수
    // timer
    private let maxValue: Double = 15                // 타이머바 크기 (15초 간격으로 넘어가기)
    @State private var timeRemaining: Double = 15    // 15초 간격으로 넘어가기
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var countingRound: Int = 0               // 라운드별로 맞추면 count하기
    @State var maxCount: Int = 5                    // 문제의 갯수
    // animation paused
    @State private var isPaused: Bool = true
    @State var connectedTimer: Cancellable? = nil
    // ViewChange하는 변수
    @State private var roundChanging:Bool = false   // 게임 라운드가 바뀌는 변수
    @State private var roundCount = Int()           // 게임 라운드를 세는 변수
    @State         var showScorePage:Bool = false   // 게임 마지막 결과 화면
    @State private var showAns:Bool = false         // 답을 가리기 위한 조건 (삼항 조건 연산자에서 쓰임 question ? answer1 : answer2 구조)
    // 단어 제공
    @State private var vocabularyOrder = [Int]()
    // 한글 뜻을 나타낼 변수
    @State var kWord: String = ""
    // 게임을 진행할 단어의 위치 사용, 저장하는 변수
    @State private var offset = [CGSize]()          // 선택하는 단어 위치 나타내는 변수
    @State private var newPosition = [CGSize]()     // 선택하는 단어의 새로운 위치를 나타내는 변수 (답을 입력하는 칸의 위치)
    @State var ans = alphabet()                     // alphabet()를 사용하는 변수 ans(선택하는 부분의 위치)
    @State var ques = alphabet()                    // alphabet()를 사용하는 변수 ques(답을 입력하는 부분의 위치)
    @State private var ansChars = [String]()        // 선택하는 부분의 단어(글자) (Char)
    @State private var quesChars = [String]()       // 답을 입력하는 부분의 단어(글자) (Char)
    @State private var koreanString = [String]()    // 뜻을 나타낼 변수 (한글 뜻)
    // 게임을 진행할 단어를 꾸미는 변수
    let color: [Color] = [.gray,.green]
    @State private var fgColor: Color = .white      // 선택하는 단어 색 고르는 변수
    @State private var ansTextSize:CGFloat = 50     // 선택하는 부분의 원의 크기를 지정
    @State private var quesTextSize:CGFloat = 60    // 답을 입력하는 부분의 원의 크기를 지정
    
    // 단어를 읽는 부분 -> 나중에 구현될 부분
    @State private var vocaSpeak = [Bool]()
    let synthesizer = AVSpeechSynthesizer()
    

    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    // 라운드가 바뀌고있으면
                    if(roundChanging){
                        Text("Round \(roundCount+0)")
                            .font(.system(size:50,design: .monospaced))
                    }
                    else{
                        VStack{
                            // count
                            Text("\(countingRound)/\(maxCount)")
                                .frame(alignment: .leading)
                            // 타이머 바
                            TimerBar(value: self.timeRemaining,
                                     maxValue: self.maxValue,
                                     foregroundColor: .green)
                                .frame(height: 15)
                            Spacer()
                            ZStack{
                                // 뜻과 예문 나타내는 설명창
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .frame(width: 300, height: 220)
                                Text("\(kWord)")
                                    .font(.headline)
                                    .padding(30)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            // 글자를 선택하는 부분 -> 분석필요
                            HStack(alignment: .center,spacing:15){
                                Group{
                                    ForEach(ansChars.indices,id:\.self){
                                        (index) in
                                        
                                        Text("\(ansChars[index])")
                                            .font(.system(size:15,design: .monospaced))
                                            .foregroundColor(.blue)
                                            .frame(width: ansTextSize, height: ansTextSize)
                                            .background(.white)
                                            .cornerRadius(50)
                                            .overlay(RoundedRectangle(cornerRadius: 50)
                                                        .stroke(Color.yellow,lineWidth: 2))
                                            .overlay(GeometryReader(content:{geometry in
                                                let _ = updatePos(geometry:geometry,ptr:&ans.pos[index])
                                                Color.clear
                                            }))
                                            .onTapGesture {
                                                print("offset[\(index)]:\(offset[index])")
                                                print("newPosition[\(index)]:\(newPosition[index])")
                                                print("ansPos[\(index)]:\(ans.pos[index])")
                                                print("(\(ans.pos[index].origin.x-newPosition[index].width),\(ans.pos[index].origin.y-newPosition[index].height))")
//                                                fgColor = color.randomElement()!
                                            }
                                            .offset(offset[index])
                                            .gesture(DragGesture()
                                                        .onChanged({value in
                                                if(ans.correct[index]){ return }
                                                if(!vocaSpeak[index]){
                                                    vocaSpeak[index] = true
//                                                        strSpeacker(str:ansChars[index])
                                                }
                                                offset[index].width = value.translation.width + newPosition[index].width
                                                offset[index].height = value.translation.height + newPosition[index].height
                                            })
                                            .onEnded({ value in
                                                if(ans.correct[index]){ return }
                                                vocaSpeak[index] = false
                                                newPosition[index].width = offset[index].width
                                                newPosition[index].height = offset[index].height
                                                for i in 0...quesChars.count-1{
                                                    if(ansChars[index] == quesChars[i] && !ques.correct[i]){
                                                        if(cmpDistance(dic:(ansTextSize+quesTextSize)/2,A:ques.pos[i],Asize: quesTextSize,B:ans.pos[index],Bsize: ansTextSize)){
                                                            print("cmpDistance pass")
                                                            print("ques.pos[\(i)]:\(ques.pos[i].origin)")
                                                            print("ans.pos[\(index)]:\(ans.pos[index].origin)")
                                                            print("offset[\(index)]:\(offset[index])")
                                                            print("newPosition[\(index)]:\(newPosition[index])")
                                                            offset[index].width = ques.pos[i].origin.x - (ans.pos[index].origin.x-newPosition[index].width) + 5
                                                            offset[index].height = ques.pos[i].origin.y - (ans.pos[index].origin.y-newPosition[index].height) + 5
                                                            newPosition[index] = offset[index]
                                                            
                                                            ans.correct[index] = true
                                                            ques.correct[i] = true
//                                                                correctPlayer.playFromStart()
                                                            break
                                                        }
                                                    }
                                                }
                                                if(!ans.correct[index]){
                                                    offset[index] = .zero
                                                    newPosition[index] = .zero
//                                                        errorPlayer.playFromStart()
                                                }
                                                var pass = true
                                                for i in ans.correct{
                                                    pass = pass && i
                                                    if(!pass){ break }
                                                }
                                                if(pass){
//                                                        self.timer?.invalidate()
//                                                        strSpeacker(str:vocaVM.Korean)
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                                        gamePlay()
                                                    }
                                                }
                                            })
                                        )
                                    }
                                }
                            }
//                            Spacer()
                            // 답을 입력하는 부분 -> 분석 필요
                            HStack(alignment: .center,spacing:15){
                                Group{
                                    ForEach(quesChars.indices,id:\.self){
                                        (index) in
                                        Text(showAns ? "\(quesChars[index])" : "")  //showAns가 ture면 quesChars[index]를 보여줌, false면 ""를 보여줌
                                            .font(.system(size:15,design: .monospaced))
                                            .foregroundColor(.blue)
                                            .frame(width: quesTextSize, height: quesTextSize)
                                            .background(Color.clear)
                                            .cornerRadius(50)
                                            .overlay(RoundedRectangle(cornerRadius: 50)
                                                        .stroke(Color.green,lineWidth: 2))
                                            .overlay(GeometryReader(content:{geometry in
                                                let _ = updatePos(geometry:geometry,ptr:&ques.pos[index])
                                                Color.clear
                                            }))
                                            .onTapGesture {
                                                print("quesPos[\(index)]:\(ques.pos[index])")
                                            }
                                    }
                                }
                            }.padding(.top,25)
                        }
                    }
                }
                .fullScreenCover(isPresented:$showScorePage,content:{
                    if(scorePageSelect()){
                        ScorePage
                    }
                    else{
                        GameOverView
                    }
                })
                .onAppear{
                    initialization() // 게임 초기화
                }
                .onDisappear{
                    //            self.timer?.invalidate()
                }
                .onReceive(timer) { time in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
            }
        }
    }
}
// MARK: - 함수
extension MiniGame2B {
    // 초기화함수
    func initialization(){
        vocabularyOrder.removeAll() // 배열의 모든 요소 제거 (단어 초기화)
        for i in 0...vocabularyDataSet.count-1{
            vocabularyOrder.append(i)   // DataSet에서 단어 가져옴
        }
        vocabularyOrder.shuffle()   // 단어를 섞음
        roundCount = 0              // 단어의 개수 세기 몇개를 했는지 보여주기 -> 페이지가 아닌 상단에 숫자로 표현하기
        gamePlay()                  // 게임을 시작하는 함수
        print("initialization end")
    }
    // Round 초기화 (Round 별로 단어가 바뀌게 만들어줘야됨)
    func initialRound(){
        showAns = false             // 초기화 하기위해 round조건을 false로 만듦.
        vocaVM = vocabularyDataSet[vocabularyOrder.removeLast()]    // DataSet에서 제공한 단어를 삭제(가장 마지막 요소를 제거) +가장 마지막 요소를 제거한 데이터 셋이 VM이다.
        vocabularyInit(voca:vocaVM.English)     // 영어 단어로 단어생성자에 넣기(초기화)
        kWord = vocaVM.Korean                   // 한글 단어로 초기화
        
//        strSpeacker(str:"")
    }
    // 게임 시작
    func gamePlay(){
        if(vocabularyOrder.count<=0){   // vocabularyOrder배열이 0이하가 되면
            showScorePage = true        // 마지막 화면을 보여주기 위한 변수 true로 바꿈
            return
        }
        nextRoundDelay()                // Round를 Count하는 함수 (View로 가기 전)
        initialRound()                  // Round를 초기화 (단어를 바꾸기위해)
    }
    // 단어의 위치를 통해 답이 맞는지 확인하는 함수
    func cmpDistance(dic:CGFloat,A:CGRect,Asize:CGFloat,B:CGRect,Bsize:CGFloat)->Bool{
        let Dis = pow(dic,2)
        let aX:CGFloat = A.origin.x + Asize/2
        let aY:CGFloat = A.origin.y + Asize/2
        let bX:CGFloat = B.origin.x + Bsize/2
        let bY:CGFloat = B.origin.y + Bsize/2
        let tmp = pow(aX-bX,2)+pow(aY-bY,2)
        print("|A-B| = \(sqrt(tmp))")
        if(Dis > tmp){
            return true
        }
        return false
    }
    // ‼️‼️‼️‼️ 단어를 읽어주는 함수 -> 목소리가 너무 느리고 이상함!
//    func strSpeacker(str:String, rate:Float=0.01){
//        let tmp = AVSpeechUtterance(string: str)
//        tmp.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//        tmp.rate = rate
//        synthesizer.speak(tmp)
//    }
    // View를 선택하는 함수
    func scorePageSelect()->Bool{
        //        self.timer?.invalidate()
        if(vocabularyOrder.count <= 0){     // vocabularyOrder배열이 0이하가 되면
            return true                     // -> scorepage
        }
        else{                               // 아니면
            return false                    // -> gameoverview
        }
    }
    // 단어 초기화 함수
    func vocabularyInit(voca:String){
        vocaSpeak.removeAll()
        ansChars.removeAll()
        quesChars.removeAll()
        koreanString.removeAll()
        offset.removeAll()
        newPosition.removeAll()
        ans.correct.removeAll()
        ques.correct.removeAll()
        ans.pos.removeAll()
        ques.pos.removeAll()
        let n = voca.count
        offset = [CGSize](repeating: .zero, count: n)
        newPosition = [CGSize](repeating: .zero, count: n)
        ans.correct = [Bool](repeating: false, count: n)
        ques.correct = [Bool](repeating: false, count: n)
        ans.pos = [CGRect](repeating: .zero, count: n)
        ques.pos = [CGRect](repeating: .zero, count: n)
        vocaSpeak = [Bool](repeating: false, count: n)
        let chars = Array(voca)
        let charSh = chars.shuffled()
        for i in charSh{ ansChars.append(String(i)) }
        for i in chars{ quesChars.append(String(i)) }
        for i in chars{ koreanString.append(String(i))  }
    }
    // 단어의 위치를 갱신하는 함수
    func updatePos(geometry:GeometryProxy,ptr:UnsafeMutablePointer<CGRect>){
        let pos = geometry.frame(in: .global)
        ptr.pointee = pos
    }
    // 다음Round로 준비하는 함수
    func nextRoundDelay(){
        roundCount += 1
        countingRound += 1
        print("roundCount:\(roundCount)")
        roundChanging = true
        // ‼️‼️‼️시간 관련 메소드 불러오기 (16초)
        timeRemaining = 16
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
//            strSpeacker(str:vocaVM.English)
//            strSpeacker(str:vocaVM.Korean)
            roundChanging = false
            //            timerController()
        }
    }
    // (게임 페이지 별로 타이머를 설정할 예정 -> 실패할 이유가 없음)
    var GameOverView:some View{
        ZStack{
            //            backGround(imgName: .constant("background_01"),opacity: .constant(1))
            Text("GameOver")
                .font(.system(size:60, weight: .semibold,design: .monospaced))
                .foregroundColor(.red)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("pepefog")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 230, alignment: .center)
                        .clipped()
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                showScorePage = false
            }
        }
    }
    // 마지막에 결과 화면을 보여줄 View 몇 개를 맞췄는지 갯수 보이기
    var ScorePage:some View{
        ZStack{
            //            backGround(imgName: .constant("background_00"),opacity: .constant(0.75))
            VStack{
                //Text("Your record time :  600.0")
                Text("Congratulations!😄💪🐥")
                    .font(.system(size:30,design: .monospaced))
                    .foregroundColor(.black)
                //                Text("Your record time : "+String(format:"%.1f", timeClock))
                //                    .font(.system(size:30,design: .monospaced))
                //                    .foregroundColor(.blue)
                
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5){
                showScorePage = false
            }
        }
    }
}

// MARK: - Timer Bar

// 타이머 로직
let timerr = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

// 타이머 바 costum
struct TimerBar: View {
    private let value: Double
    private let maxValue: Double
    private let backgroundEnabled: Bool
    private let backgroundColor: Color
    private let foregroundColor: Color
    
    init(value: Double,
         maxValue: Double,
         backgroundEnabled: Bool = true,
         backgroundColor: Color = Color(UIColor(red: 245/255,
                                                green: 245/255,
                                                blue: 245/255,
                                                alpha: 1.0)),
         foregroundColor: Color = Color.black) {
        self.value = value
        self.maxValue = maxValue
        self.backgroundEnabled = backgroundEnabled
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometryReader in
                
                if self.backgroundEnabled {
                    Capsule()
                        .foregroundColor(self.backgroundColor)
                }
                
                Capsule()
                    .frame(width: self.progress(value: self.value,
                                                maxValue: self.maxValue,
                                                width: geometryReader.size.width)) // 5
                    .foregroundColor(self.foregroundColor) // 6
                    .animation(.easeIn) // 7
            }
        }
    }
    
    private func progress(value: Double,
                          maxValue: Double,
                          width: CGFloat) -> CGFloat {
        let percentage = value / maxValue
        print(percentage)
        print(width)
        return width *  CGFloat(percentage)
    }
}

struct MiniGame2B_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2B()
    }
}
