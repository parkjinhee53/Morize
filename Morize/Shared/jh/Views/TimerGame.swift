//
//  TimerGame.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/29.
//

import SwiftUI

// 타이머
let ttimer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct TimerGame: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = GameViewModel()
    @State var counter: Int = 0
    @State var countTo: Int = 5
    @State var gameover: Bool = false
    @State var isTimer: Bool = true
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            if gameover {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("게임 오버!")
                        .background(.black)
                }
            }
            VStack {
                HStack {
                    Text(viewModel.progressText)
                        .padding(.leading, 15)
                        .font(.system(size: 30, weight: .bold, design: .default))
                    Spacer()
                    
                    // 타이머
                    ZStack {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle().stroke(Color.init(hex: "008E00"), lineWidth: 5)
                            )

                        Circle()
                            .fill(Color.clear)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle().trim(from: 0, to: progress())
                                    .stroke(
                                        style: StrokeStyle(
                                            lineWidth: 5,
                                            lineCap: .round,
                                            lineJoin: .round
                                        )
                                    )
                                    .foregroundColor(
                                        (completed() ? Color.orange : Color.red)
                                    ).animation(
                                        Animation.easeInOut(duration: 0.2)
                                    )
                            )
                        Cllock(counter: counter, countTo: countTo)
                    }
                    .padding(.trailing, 10)
                }
                .onReceive(timer) { time in
                    if isTimer {
                        if(self.counter < self.countTo) {
                            self.counter += 1
                        }
                        else {
                            gameover = true
                        }
                    }
                    // 시간 초과되면 showAlert가 true로 바뀌면서 팝업창 뜨게 함
//                     if counter == countTo {
//                         showAlert = true
//                     }
                }//.padding()
//                     .alert(isPresented: $showAlert) {
//                         //            let firstButton = Alert.Button.default(Text("확인")) {
//                         //                print("primary button pressed")
//                         //            }
//                         //            let secondButton = Alert.Button.cancel(Text("다른 게임")) {
//                         //                print("secondary button pressed")
//                         //            }
//                         //            return Alert(title: Text("시간초과"), message: Text("다시 도전해보세요!"),
//                         //                         primaryButton: firstButton, secondaryButton: secondButton)
//                         Alert(title: Text("시간초과"), message: Text("다시 도전하세요."), dismissButton: .cancel(Text("확인")))
//                     }
                
//                 // 팝업창이 뜨고 Welcomeview로 이동인데 풀스크린으로 하려다가 실패 ...
//                 // 이것도 이상하게 뜸 ..
//                 if showAlert == true {
//                     WelcomeView()
//                 }
                Spacer()
                Text(viewModel.questionText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding()
                Spacer()
                HStack {
                    ForEach(viewModel.answerIndices) { index in
                        AnswerButton(text: viewModel.answerText(for: index)) {
                            viewModel.makeSelectionForCurrentQuestion(at: index)
                            isTimer = false
                        }
                        .background(viewModel.colorForButton(at: index))
                        .cornerRadius(32)
                        .disabled(viewModel.selectionWasMade)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    }
                } // 보기 중에서 하나 선택하면 버튼 나옴
                if viewModel.selectionWasMade {
                    Button(action: {
                        viewModel.advanceGameState()
                        counter = 0
                        countTo = 5
                        isTimer = true
                    },
                       label: {
                        BottomText(str: "Next")
                    })
                } // 시간이 지나면 버튼 나옴
//                 else if completed() {
//                    Button(action: viewModel.advanceGameState,
//                           label: {
//                            BottomText(str: "시간 초과")
//                    })
//                }
            }.padding(.bottom)
        }
        .foregroundColor(.black)
        .navigationBarHidden(true)
        .background(resultsNavigationLink)
    }
    private var resultsNavigationLink: some View {
        NavigationLink(
            destination: ResultsView(viewModel: ResultsViewModel(selectionCount: viewModel.selectionCount, gameStartTime: viewModel.gameStartTime, gameEndTime: Date())),
            isActive: .constant(viewModel.gameIsOver),
            label: { EmptyView() })
    }
    
    func completed() -> Bool {
        return progress() == 1
    }

    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
    
}

struct AnswerButton: View { // 보기
    let text: String
    let onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }) {
            Text(text)
                .font(Font.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.black)
        }
        .padding(10)
        .cornerRadius(32)
        .overlay(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.init(hex: "008E00"), lineWidth: 4)
        )
    }
}

// 타이머
struct Cllock: View {
    var counter: Int
    var countTo: Int

    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 15))
                .fontWeight(.black)
        }
    }
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)

        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

struct TimerGame_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerGame()
        }
    }
}
