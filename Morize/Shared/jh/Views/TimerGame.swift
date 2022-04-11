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
    @StateObject var viewModel = GameViewModel()
    @State var counter: Int = 0
    var countTo: Int = 5
    
    @State var end = false
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            VStack {
//                Text(viewModel.progressText)
//                    .foregroundColor(.black)
//                    .font(.system(size: 20))
//                Spacer()
                HStack {
                    Text(viewModel.progressText)
                        .padding(.leading, 30)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    Spacer()
                    
                    // 타이머
                    ZStack {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Circle().stroke(Color.green, lineWidth: 10)
                            )

                        Circle()
                            .fill(Color.clear)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Circle().trim(from: 0, to: progress())
                                    .stroke(
                                        style: StrokeStyle(
                                            lineWidth: 10,
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
                }
                .onReceive(timer) { time in
                    if(self.counter < self.countTo) {
                        self.counter += 1
                    }
                    // 시간 초과되면 showAlert가 true로 바뀌면서 팝업창 뜨게 함
                    if counter == countTo {
                        showAlert = true
                    }
                }//.padding()
                    .alert(isPresented: $showAlert) {
                        //            let firstButton = Alert.Button.default(Text("확인")) {
                        //                print("primary button pressed")
                        //            }
                        //            let secondButton = Alert.Button.cancel(Text("다른 게임")) {
                        //                print("secondary button pressed")
                        //            }
                        //            return Alert(title: Text("시간초과"), message: Text("다시 도전해보세요!"),
                        //                         primaryButton: firstButton, secondaryButton: secondButton)
                        Alert(title: Text("시간초과"), message: Text("다시 도전하세요."), dismissButton: .cancel(Text("확인")))
                    }
                
                // 팝업창이 뜨고 Welcomeview로 이동인데 풀스크린으로 하려다가 실패 ...
                // 이것도 이상하게 뜸 ..
                if showAlert == true {
                    WelcomeView()
                }
                
                // showAlert = false로 바꿔야 팝업창이 안뜨는 것 같은데
                // 코드를 어떻게 적어야 할지 모르겠어요....
                
                // 게임
                // 문제
                Text(viewModel.questionText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding()
                Spacer()
                Spacer()
                VStack { // 보기
                    ForEach(viewModel.answerIndices) { index in
                        AnswerButton(text: viewModel.answerText(for: index)) {
                            viewModel.makeSelectionForCurrentQuestion(at: index)
                        }
                        .background(viewModel.colorForButton(at: index))
                        .disabled(viewModel.selectionWasMade)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    }
                } // 보기 중에서 하나 선택하면 버튼 나옴
                if viewModel.selectionWasMade {
                    Button(action: viewModel.advanceGameState,
                           label: {
                            BottomText(str: "다음")
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
        }
        .padding()
        .border(Color.green, width: 2)
    }
}

// 타이머
struct Cllock: View {
    var counter: Int
    var countTo: Int

    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 20))
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
