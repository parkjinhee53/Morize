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
                }
                Spacer()
                // 게임 
                Text(viewModel.questionText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
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
                    }
                }
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
                }
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

struct AnswerButton: View {
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
