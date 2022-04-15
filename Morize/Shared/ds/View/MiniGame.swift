//
//  MiniGame.swift
//  Morize (iOS)
//
//  Created by judongseok on 2021/12/29.
//

import SwiftUI
import Combine

struct MiniGame: View {
    @Environment(\.presentationMode) var presentationMode
    // viewModel
    @ObservedObject var viewModel = MiniGameVM()
    // timer
    @State private var time: Double = 0
    // animation paused
    @State private var isPaused: Bool = true
    @State var connectedTimer: Cancellable? = nil
    
    @State var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    
    func setWord() {
        self.viewModel.setGame(count: 8)
    }
    
    func instantiateTimer() {
        setWord()
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common)
        self.connectedTimer = self.timer.connect()
        return
    }
    
    func cancelTimer() {
        self.connectedTimer?.cancel()
        return
    }
    
    func resetCounter() {
        self.time = 0
        return
    }
    
    func restartTimer() {
        self.time = 0
        self.cancelTimer()
        self.instantiateTimer()
        return
    }
    var body: some View {
        ZStack{
            LottieView(filename: "fireworks", isPaused: isPaused)
                .frame(width: 400, height: 400, alignment: .center)
            VStack(alignment: .center){
                VStack(alignment: .leading){
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                    }
                    .frame(width: 19, height: 16)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                Spacer()
                Text("Time: \(String(format: "%.1f", time))")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .onAppear {
                        self.instantiateTimer()
                    }
                    .onReceive(timer) { _ in
                        time += 0.1
                    }
                Spacer()
                ForEach(0..<viewModel.level, id: \.self){ i in
                    HStack{
                        ForEach(0..<viewModel.level, id: \.self){ j in
                            Button {
                                if viewModel.buttonArray[(i * 4) + (j)] != 2 {
                                    if viewModel.checkArray.isEmpty{
                                        viewModel.add(pos: (i * 4) + (j))
                                        viewModel.buttonArray[(i * 4) + (j)] = 1
                                        print(viewModel.checkArray)
                                    }
                                    else{
                                        // 단어와 뜻이 맞으면 disable
                                        if viewModel.check(a: viewModel.wordFour[viewModel.checkArray[0]], b: viewModel.wordFour[(i * 4) + (j)]) {
                                            viewModel.buttonArray[(i * 4) + (j)] = 2
                                            viewModel.buttonArray[viewModel.checkArray[0]] = 2
                                            // 게임이 끝났는지 체크
                                            if viewModel.checkEnd(){
                                                cancelTimer()
                                                self.isPaused = false
                                            }
                                        }
                                        // 단어와 뜻이 다르면
                                        else {
                                            for i in viewModel.checkArray{
                                                viewModel.buttonArray[i] = 0
                                            }
                                        }
                                        viewModel.checkArray.removeAll()
                                    }
                                }
                            } label: {
                                Text(viewModel.wordFour[(i * 4) + (j)])
                                    .frame(width: 70, height: 70, alignment: .center)
                                    .foregroundColor(Color.white)
                                    .font(.custom("NotoSansKR-Regular", size: 14))
                            }
                            .background(viewModel.buttonArray[(i * 4) + (j)] == 0 ? Color(hex: "008E00") : Color(hex: "D8E9A8"))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            // Disable Animation
                            .scaleEffect(viewModel.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: viewModel.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
                        }
                    }
                }
                VStack {
                    Text("\(String(format: "%.1f", time)) 만에 완료!")
                        .foregroundColor(.black)
                        .padding(.top, 50)
                        .padding(.bottom, 10)
                    
                    HStack{
                        Button{
                            // 애니메이션 중단
                            self.isPaused = true
                            // 퍼즐 재생성
                            viewModel.resetGame()
                            // 시간 초기화
                            restartTimer()
                        } label: {
                            Text("다시하기")
                                .foregroundColor(Color.init(hex: "008E00"))
                        }
                    }
                }
                .opacity(viewModel.checkEnd() ? 1 : 0 )
                Spacer()
            }
        }
    }
}
