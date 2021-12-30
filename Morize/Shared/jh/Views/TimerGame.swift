//
//  TimerGame.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/29.
//

import SwiftUI

struct TimerGame: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Text(viewModel.progressText)
                    .padding()
                Spacer()
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

struct TimerGame_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerGame()
        }
    }
}
