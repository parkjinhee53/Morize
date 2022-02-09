//
//  TimerGame.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/29.
//

import SwiftUI

let ttimer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct TimerGame: View {
    @StateObject var viewModel = GameViewModel()
    @State var counter: Int = 0
    var countTo: Int = 120
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                HStack {
                    Text(viewModel.progressText)
                        .padding(.leading, 30)
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
                }
                
                // 게임 
                Text(viewModel.questionText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Spacer()
                HStack {
                    ForEach(viewModel.answerIndices) { index in
                        AnswerButton(text: viewModel.answerText(for: index)) {
                            viewModel.makeSelectionForCurrentQuestion(at: index)
                        }
                        .background(viewModel.colorForButton(at: index))
                        .disabled(viewModel.selectionWasMade)
                    }
                }
                if viewModel.selectionWasMade {
                    Button(action: viewModel.advanceGameState,
                           label: {
                            BottomText(str: "Next")
                    })
                }
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

struct AnswerButton: View {
    let text: String
    let onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }) {
            Text(text)
        }
        .padding()
        .border(Color.blue, width: 4)
    }
}

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
