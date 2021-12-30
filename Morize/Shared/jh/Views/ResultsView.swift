//
//  ResultsView.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import SwiftUI

struct ResultsView: View {
    let viewModel: ResultsViewModel
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Text("Final Score: ")
                    Text(viewModel.finalPercentText)
                }
                .font(.title)
                .padding()
                HStack {
                    Text("Letter Grade: ")
                    Text(viewModel.letterGradeText)
                }
                .padding()
                .font(.title)
                Text(viewModel.correctSelectionText)
                    .font(.system(size: 30))
                Text(viewModel.incorrectSelectionText)
                    .font(.system(size: 30))
                Text("Total time: \(viewModel.totalGameTimeText)")
                Spacer()
                NavigationLink(
                    destination: TimerGame(),
                    label: {
                        BottomText(str: "Re-take Quiz")
                            .padding(.bottom)
                    })
            }
        }
        .navigationBarHidden(true)
    }
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultsView(viewModel: ResultsViewModel(selectionCount: (3,1), gameStartTime: Date(), gameEndTime: Date()))
        }
    }
}
