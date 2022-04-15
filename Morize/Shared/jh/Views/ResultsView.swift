//
//  ResultsView.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import SwiftUI

struct ResultsView: View {
    let viewModel: ResultsViewModel
    
    @State var start = false
    @State var end = false
    
    var body: some View {
        ZStack {
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
                
                HStack {
                    Button("뒤로가기") {
                        print("asdf")
                        end = true
                    }
                    .fullScreenCover(isPresented: $end, content: MiniGameView.init)
                    .font(.custom("NotoSansKR-Bold", size: 20))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                    .background(Color.init(hex: "666666"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 50)
                    .padding(.leading, 16)
                    
                    Spacer()
                    Button("다시하기") {
                        print("asdf")
                        start = true
                    }
                    .fullScreenCover(isPresented: $start, content: TimerGame.init)
                    .font(.custom("NotoSansKR-Bold", size: 20))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                    .background(Color.init(hex: "008E00"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 50)
                    .padding(.trailing, 16)
                }
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
