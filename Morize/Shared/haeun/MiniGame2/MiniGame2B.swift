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
    @State private var sliderValue: Double = 0
    private let maxValue: Double = 10
    
    // animation paused
    @State private var isPaused: Bool = true
    @State var connectedTimer: Cancellable? = nil
    
    //    let answerCount: (correct: Int, incorrect: Int)
    
    var body: some View {
        ZStack{
            VStack{
                // 타이머 바
                TimerBar(value: $sliderValue.wrappedValue,
                         maxValue: self.maxValue,
                         foregroundColor: .green)
                    .frame(height: 10)
                // countdown 타이머로 바꾸기 (지금은 슬라이드)
                Slider(value: $sliderValue,
                       in: 0...maxValue)
                
                
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
// Minigame2BVM으로 옮기기

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

struct MiniGame2B_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2B()
    }
}
