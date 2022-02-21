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
    @ObservedObject var viewM = MiniGame2BVM()
    // timer
//    @State private var time: Double = 0
    @State var countt: Int = 0
    var counto: Int = 10
    
    // animation paused
    @State private var isPaused: Bool = true
    @State var connectedTimer: Cancellable? = nil

//    let answerCount: (correct: Int, incorrect: Int)
    
    var body: some View {
        ZStack{
            VStack{
                // 타이머
//                Text("\(String(format: "%.2f", time))")
//                    .font(.system(size: 30, weight: .bold, design: .monospaced))
//                    .onAppear {
//                        self.instantiateTimer()
//                    }
//                    .onReceive(timer) { _ in
//                        time += 0.01
//                    }
                ZStack{
                    TimerTrack()
                    TimerBar(counterr: countt, countToo: counto)
                }.onReceive(timerr) { time in
                    if (self.countt < self.counto) {
                        self.countt += 1
                    }
                }
                
                ForEach(0..<viewM.level){ i in
                    HStack{
                        ForEach(0..<viewM.level){ j in
                            Button {
                                if viewM.checkArray.isEmpty{
                                    viewM.add(pos: (i * 4) + (j))
                                    viewM.buttonArray[(i * 4) + (j)] = 1
                                    print(viewM.checkArray)
                                }
                                else{
                                    // 단어와 뜻이 맞으면 disable
                                    if viewM.check(a: viewM.wordFour[viewM.checkArray[0]], b: viewM.wordFour[(i * 4) + (j)]) {
                                        viewM.buttonArray[(i * 4) + (j)] = 2
                                        viewM.buttonArray[viewM.checkArray[0]] = 2
                                        // 게임이 끝났는지 체크
                                        if viewM.checkEnd(){
                                            cancelTimer()
                                            self.isPaused = false
                                        }
                                    }
                                    // 단어와 뜻이 다르면
                                    else {
                                        for i in viewM.checkArray{
                                            viewM.buttonArray[i] = 0
                                        }
                                    }
                                    viewM.checkArray.removeAll()
                                }
                            } label: {
                                Text(viewM.wordFour[(i * 4) + (j)])
                                    .frame(width: 70, height: 70, alignment: .center)
                            }
                            .background(viewM.buttonArray[(i * 4) + (j)] == 0 ? Color(hex: "4E9F3D") : Color(hex: "D8E9A8"))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            // Disable Animation
                            .scaleEffect(viewM.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: viewM.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
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
                        viewM.resetGame()
                    } label: {
                        Text("다시하기")
                    }
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

//
struct TimerTrack: View {
    var body: some View {
        Capsule()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Capsule().stroke(Color.gray, lineWidth: 15)
            )
    }
}

struct TimerBar: View {
    var counterr: Int
    var countToo: Int
    
    var body: some View {
        Capsule()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Capsule().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(
                        (completed() ? Color.yellow : Color.green)
                    ).animation(
                        .easeInOut(duration: 0.2)
                    )
            )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counterr) / CGFloat(countToo))
    }
}

struct MiniGame2B_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2B()
    }
}
