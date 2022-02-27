//
//  MiniGame2B.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/17.
//

import SwiftUI
import Combine
import AVFoundation

enum Pages{
    case HomePage, GamePage, SavePhotoPage//, GameOverPage, ScorePage
}

class alphabet:ObservableObject{
    @Published var pos = [CGRect]()
    @Published var correct = [Bool]()
}

struct MiniGame2B: View {
    // viewModel
    @ObservedObject var viewM = MiniGame2BVM()
    // timer
    //    @State private var time: Double = 0
    
    // sliderValue를 타이머값으로 넣어야될 듯
    @State private var sliderValue: Double = 0
    private let maxValue: Double = 10
    
    // animation paused
    @State private var isPaused: Bool = true
    @State var connectedTimer: Cancellable? = nil
    
    //    let answerCount: (correct: Int, incorrect: Int)
    
    
    @Binding var currentPage:Pages
    @Binding var savePhotos:Bool
    let color: [Color] = [.gray,.green]
//    let timeMax:CGFloat = 300
    let maxPlayRounds:Int = 10
//    let synthesizer = AVSpeechSynthesizer()
    //@State var playerItem = AVPlayerItem(url : Bundle.main.url(forResource: "crrect_answer", withExtension: "mp3")!)
//    var correctPlayer: AVPlayer{ AVPlayer.sharedCorrectPlayer }
//    var errorPlayer:   AVPlayer{ AVPlayer.sharedErrorPlayer }
    @State         var showScorePage:Bool = false
    @State private var showAns:Bool = false
    //@State private var scorePageSelect:Int = 0
//    @State         var username = String()
    @State private var vocabularyOrder = [Int]()
    @State private var fgColor: Color = .white
    @State private var offset = [CGSize]()
    @State private var newPosition = [CGSize]()
    @State var ans = alphabet()//[CGRect]()
    @State var ques = alphabet()//[CGRect]()
    @State private var ansTextSize:CGFloat = 50
    @State private var quesTextSize:CGFloat = 60
    @State private var vocaSpeak = [Bool]()
    @State private var ansChars = [String]()
    @State private var quesChars = [String]()
    @State private var currentVoca = Vocabulary()
    @State private var roundChanging:Bool = false
    @State private var roundCount = Int()
    
    func initialGame(){
        vocabularyOrder.removeAll()
        //playRoundCount = 0
        for i in 0...vocabularyDataSet.count-1{
            vocabularyOrder.append(i)
        }
        vocabularyOrder.shuffle()
//        timeClock = timeMax
        roundCount = 0
        gamePlay()
        print("initialGame end")
    }
    
    func initialRound(){
//        username = ""
        showAns = false
        currentVoca = vocabularyDataSet[vocabularyOrder.removeLast()]
        vocabularyInit(voca:currentVoca.English)
//        strSpeacker(str:"")
    }
    
    func gamePlay(){
        if(vocabularyOrder.count<=0){
            showScorePage = true
            return
        }
        nextRoundDelay()
        initialRound()
    }
    
    var body: some View {
        ZStack{
            VStack{
                // 타이머 바
                // value를 타이머 값으로
                TimerBar(value: $sliderValue.wrappedValue,
                         maxValue: self.maxValue,
                         foregroundColor: .green)
                    .frame(height: 10)
                
                // countdown 타이머로 바꾸기 (지금은 슬라이드)
                Slider(value: $sliderValue,
                       in: 0...maxValue)
                
                ZStack{
                    if(roundChanging){
                        Text("Round \(roundCount+0)")
                            .font(.system(size:50,design: .monospaced))
                    }
                    else{
                        VStack{
                            // 뜻과 예문 나타내는 설명창
                            HStack{
                                Rectangle()
                                    .size(width: 10, height: 10)
                            }.padding(30)
                            
                            // 글자를 선택하는 부분
                            HStack(alignment: .center,spacing:15){
                                Group{
                                    ForEach(ansChars.indices,id:\.self){
                                        (index) in
                                        Text("\(ansChars[index])")
                                            .font(.system(size:15,design: .monospaced))
                                            .foregroundColor(.blue)
                                            .frame(width: ansTextSize, height: ansTextSize)
                                            .background(fgColor)
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
                                                fgColor = color.randomElement()!
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
        //                                                        strSpeacker(str:currentVoca.Korean)
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                                                    gamePlay()
                                                                }
                                                            }
                                                        })
                                            )
                                    }
                                }
                            }
                            Spacer()
                            // 답을 입력하는 부분
                            HStack(alignment: .center,spacing:15){
                                Group{
                                    ForEach(quesChars.indices,id:\.self){
                                        (index) in
                                        Text(showAns ? "\(quesChars[index])" : "")//alphabet background
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
                    initialGame()
                }
                .onDisappear{
        //            self.timer?.invalidate()
                }
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
        return width *  CGFloat(percentage)
    }
}

extension MiniGame2B{
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
    
//    func strSpeacker(str:String,rate:Float=0.05){
//        let tmp = AVSpeechUtterance(string: str)
//        tmp.voice = AVSpeechSynthesisVoice(language: "de-DE")
//        tmp.rate = rate
//        synthesizer.speak(tmp)
//    }
    
//    func soundEffectPlayer(/*str:String="crrect_answer"*/){
//        //
//    }
    func scorePageSelect()->Bool{
//        self.timer?.invalidate()
        if(vocabularyOrder.count <= 0){
            return true//scarepage
        }
        else{
            return false//gameoverview
        }
    }
    func vocabularyInit(voca:String){
        vocaSpeak.removeAll()
        ansChars.removeAll()
        quesChars.removeAll()
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
    }
    func updatePos(geometry:GeometryProxy,ptr:UnsafeMutablePointer<CGRect>){
        let pos = geometry.frame(in: .global)
        ptr.pointee = pos
    }

    func nextRoundDelay(){
        roundCount += 1
        print("roundCount:\(roundCount)")
        roundChanging = true
//        timerController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
//            strSpeacker(str:currentVoca.Korean)
            roundChanging = false
//            timerController()
        }
    }
    func imageExist(inName: String) -> Bool {
        if let _ = UIImage(named: inName) {
            return true
        }
        else {
            return false
        }
    }
    var vocabularyImage:some View{
        Button(action: {
//            strSpeacker(str: currentVoca.Korean,rate:0.025)
        }, label: {
            Image(currentVoca.fileName == "" ? "default" : currentVoca.fileName)
                .resizable()
                //.background(Color.white)
                .scaledToFit()
                .frame(width: 130, height: 100, alignment: .center)
                .background(Color.white)
                .clipped()
                .border(Color.gray,width: 1)
        })
    }
}

extension MiniGame2B{
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
                currentPage = Pages.HomePage
                showScorePage = false
            }
        }
    }
    
    var ScorePage:some View{
        ZStack{
//            backGround(imgName: .constant("background_00"),opacity: .constant(0.75))
            VStack{
                //Text("Your record time :  600.0")
                Text("Congratulations!😄💪🐥")
                    .font(.system(size:55,design: .monospaced))
                    .foregroundColor(.black)
//                Text("Your record time : "+String(format:"%.1f", timeClock))
//                    .font(.system(size:30,design: .monospaced))
//                    .foregroundColor(.blue)
                
//                TextField("Your Name", text: $username)
//                    .frame(width:300)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                     //.keyboardType(.numberPad)
            }
        }
        .onAppear{
            savePhotos = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5){
                currentPage = Pages.HomePage
                showScorePage = false
            }
        }
    }
}

struct MiniGame2B_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2B(currentPage: .constant(Pages.GamePage),savePhotos:.constant(false))
    }
}
