//
//  minigame2View.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/02.
//

import SwiftUI
import Combine
import Lottie

//struct MiniGame2View: View {
//    @ObservedObject var viewM = MiniGame2VM()
//    @State private var isPaused: Bool = true
//    
//    var body: some View {
//        VStack{
//            Image(systemName: "lightbulb")
//            
//            GroupBox{
//                ForEach(0..<10){ i in
//                    HStack{
//                        ForEach(0..<10){ j in
//                            Button {
//                                // 단어별로 숫자를 다르게 해서 저장 -> 보드의 숫자를 다르게
//                                // 단어를 저장해서 1자리에 넣기 
//                                if viewM.mapboard[i][j] == 1 {
//                                    // 입력가능
//                                    
//                                    
//                                }
//                                else if viewM.gameboard[i][j] == 2 {
//                                    // 정답
//                                }
//                                else {
//                                    // 벽
//                                }
//                            }
//                        label: {
//                            Text("")
//                                .frame(width: 30, height: 30, alignment: .center)
//                        }
//                        .background(viewM.gameboard[i][j] == 1 ? Color(hex: "4E9F3D") : Color.clearColor)
//                        .font(.system(size: 10, weight: .bold, design: .monospaced))
//                        .foregroundColor(.black)
//                        .cornerRadius(9)
//                        }
//                    }
//                }
//            }
//        }.padding()
//        GroupBox{
//            // mapboard를 클릭하면(숫자를 클릭하면) 그에 맞는 한글 뜻이 나와야 됨.
//            for i in viewM.answer {
//                Text(i)
//            }
//        }
//        GroupBox{
//            ForEach(0..<2){ i in
//                HStack{
//                    ForEach(0..<6){ j in
//                        Button {
//                            if viewM.checkArray.isEmpty{
//                                viewM.add(pos: (i * 2) + (j))
//                                viewM.alphaboard[(i * 2) + (j)] = 1
//                                print(viewM.checkArray)
//                            }
//                            else{
//                                // 단어와 뜻이 맞으면 disable
//                                if viewM.check(a: viewM.alphabet[viewM.checkArray[0]], b: viewM.alphabet[(i * 2) + (j)]) {
//                                    viewM.alphaboard[(i * 2) + (j)] = 2
//                                    viewM.alphaboard[viewM.checkArray[0]] = 2
//                                    // 게임이 끝났는지 체크
//                                    if viewM.checkEnd(){
//                                        self.isPaused = false
//                                    }
//                                }
//                                // 단어와 뜻이 다르면
//                                else {
//                                    for i in viewM.checkArray{
//                                        viewM.alphaboard[i] = 0
//                                    }
//                                }
//                                viewM.checkArray.removeAll()
//                            }
//                        } label: {
//                            Text(viewM.alphabet[(i * 2) + (j)])
//                                .frame(width: 50, height: 50, alignment: .center)
//                        }
//                        .background(viewM.alphaboard[(i * 2) + (j)] == 0 ? Color(hex: "4E9F3D") : Color(hex: "D8E9A8"))
//                        .font(.system(size: 12, weight: .bold, design: .monospaced))
//                        .foregroundColor(.black)
//                        .cornerRadius(8)
//                        // Disable Animation
//                        .scaleEffect(viewM.alphaboard[(i * 2) + (j)] == 2 ? 0 : 1)
//                        .animation(.easeInOut(duration: 0.3), value: viewM.alphaboard[(i * 4) + (j)] == 2 ? 0 : 1)
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct minigame2View_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniGame2View()
//    }
//}
