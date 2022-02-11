//
//  minigame2View.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/02.
//

import SwiftUI

struct MiniGame2View: View {
    @ObservedObject var viewModel = MiniGame2VM()
    @State private var isPaused: Bool = true
    
    var body: some View {
        VStack{
//            GroupBox{
//                Spacer()
//                Text("d")
//                Spacer()
//            }.padding()
//            GroupBox{
//                ForEach(0..<2){ i in
//                    HStack{
//                        ForEach(0..<6){ j in
//                            Button {
//                                if viewModel.checkArray.isEmpty{
//                                    viewModel.add(pos: (i * 4) + (j))
//                                    viewModel.buttonArray[(i * 4) + (j)] = 1
//                                    print(viewModel.checkArray)
//                                }
//                                else{
//                                    // 단어와 뜻이 맞으면 disable
//                                    if viewModel.check(a: viewModel.wordFour[viewModel.checkArray[0]], b: viewModel.wordFour[(i * 4) + (j)]) {
//                                        viewModel.buttonArray[(i * 4) + (j)] = 2
//                                        viewModel.buttonArray[viewModel.checkArray[0]] = 2
//                                        // 게임이 끝났는지 체크
//                                        if viewModel.checkEnd(){
//                                            self.isPaused = false
//                                        }
//                                    }
//                                    // 단어와 뜻이 다르면
//                                    else {
//                                        for i in viewModel.checkArray{
//                                            viewModel.buttonArray[i] = 0
//                                        }
//                                    }
//                                    viewModel.checkArray.removeAll()
//                                }
//                            } label: {
//                                Text(viewModel.wordFour[(i * 4) + (j)])
//                                    .frame(width: 50, height: 50, alignment: .center)
//                            }
//                            .background(viewModel.buttonArray[(i * 4) + (j)] == 0 ? Color(hex: "4E9F3D") : Color(hex: "D8E9A8"))
//                            .font(.system(size: 12, weight: .bold, design: .monospaced))
//                            .foregroundColor(.black)
//                            .cornerRadius(8)
//                            // Disable Animation
//                            .scaleEffect(viewModel.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
//                            .animation(.easeInOut(duration: 0.3), value: viewModel.buttonArray[(i * 4) + (j)] == 2 ? 0 : 1)
//                        }
//                    }
//                }
//            }
        }
    }
}

struct MiniGame2View_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2View()
    }
}
