//
//  CardFlip.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/05.
//

import SwiftUI

struct CardFlip: View {
    @ObservedObject var viewModel = CardFlipVM()
    var body: some View {
        ZStack{
            ForEach(0..<viewModel.getWordsCount()) { i in
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(LinearGradient(gradient: Gradient(colors: viewModel.getColor(index: i)), startPoint: .top, endPoint: .bottomTrailing))
                        .frame(width: 300, height: 250, alignment: .center)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.15), radius: 15, x: 0, y: 0)
                    Text(viewModel.words[i])
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                }
                .rotation3DEffect(viewModel.flipped[i] ? Angle(degrees: -180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                .offset(viewModel.dragOffset[i])
                .zIndex(viewModel.zIndexs[i])
                .modifier(AnimatableModifierDouble(bindedValue: viewModel.dragOffset[i].height, completion: {
                    withAnimation(Animation.easeIn(duration: 0.2)) {
                        viewModel.zIndexs = viewModel.zindexsArr[(viewModel.currentIdx % 4)]
                        viewModel.dragOffset[i] = CGSize(width: 0, height: 0)
                    }
                }))
                .onTapGesture {
                    // explicitly apply animation on toggle (choose either or)
                    withAnimation {
                        viewModel.flipped[i].toggle()
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            viewModel.dragOffset[i] = CGSize(width: 0, height: gesture.translation.height)
                        }
                        .onEnded { gesture in
                            // 위로 넘어가는 애니메이션
                            if viewModel.dragOffset[i].height <= -100 {
                                viewModel.currentIdx += 1
                                withAnimation(Animation.easeOut(duration: 0.2)) {
                                    viewModel.dragOffset[i] = CGSize(width: 0, height: -250)
                                }
                            }
                            // 제자리로
                            else{
                                withAnimation(Animation.easeInOut(duration: 0.2)) {
                                    viewModel.dragOffset[i] = .zero
                                }
                            }
                        }
                )
            }
        }
    }
}

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
