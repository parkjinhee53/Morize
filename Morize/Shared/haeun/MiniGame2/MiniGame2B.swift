//
//  MiniGame2B.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/17.
//

import SwiftUI
import Combine

struct MiniGame2B: View {
    // viewModel
    @ObservedObject var viewModel = MiniGame2BVM()
    // timer
    @State private var time: Double = 0
    // animation paused
    @State private var isPaused: Bool = true
    @State var connectedTimer: Cancellable? = nil
    
    @State var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    
    func instantiateTimer() {
        self.timer = Timer.publish(every: 0.01, on: .main, in: .common)
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
            VStack{
                Text("\(String(format: "%.2f", time))")
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .onAppear {
                        self.instantiateTimer()
                    }
                    .onReceive(timer) { _ in
                        time += 0.01
                    }
                ForEach(0..<viewModel.level){ i in
                    HStack{
                        ForEach(0..<viewModel.level){ j in
                            Button {
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
                            } label: {
                                Text(viewModel.wordFour[(i * 4) + (j)])
                                    .frame(width: 70, height: 70, alignment: .center)
                            }
                            .background(viewModel.buttonArray[(i * 4) + (j)] == 0 ? Color(hex: "4E9F3D") : Color(hex: "D8E9A8"))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            // Disable Animation
                            .scaleEffect(viewModel.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: viewModel.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
                        }
                    }
                }
                Text("몇초 만에 완료!")
                    .padding(.top, 50)
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
                    }
                }
            }
        }
    }
}

struct MiniGame2B_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2B()
    }
}
