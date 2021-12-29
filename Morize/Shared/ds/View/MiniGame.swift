//
//  MiniGame.swift
//  Morize (iOS)
//
//  Created by judongseok on 2021/12/29.
//

import SwiftUI

struct MiniGame: View {
    @ObservedObject var viewModel = MiniGameVM()
    var body: some View {
        HStack{
            ForEach(0..<viewModel.level){ i in
                VStack{
                    ForEach(0..<viewModel.level){ j in
                        Button {
                            if viewModel.checkArray.isEmpty{
                                viewModel.add(pos: (i * 4) + (j))
                                print(viewModel.checkArray)
                            }
                            else{
                                if viewModel.check(a: viewModel.wordFour[viewModel.checkArray[0]], b: viewModel.wordFour[(i * 4) + (j)]) {
                                    // disable
                                    viewModel.buttonArray[(i * 4) + (j)] = true
                                    viewModel.buttonArray[viewModel.checkArray[0]] = true
                                    print(viewModel.buttonArray)
                                }
                                viewModel.checkArray.removeAll()
                            }
                        } label: {
                            Text(viewModel.wordFour[(i * 4) + (j)])
                        }
                        .frame(width: 70, height: 70, alignment: .center)
                        .background(Color(.sRGB, red: 0.6, green: 0.6, blue: 1, opacity: 1))
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .opacity(viewModel.buttonArray[(i * 4) + (j)] ? 0 : 1)
                    }
                }
            }
        }
    }
}

struct MiniGame_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame()
    }
}
