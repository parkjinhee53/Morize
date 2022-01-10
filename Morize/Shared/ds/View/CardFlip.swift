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
                Flashcard(front: {
                    Text(viewModel.words[i])
                }, back: {
                    Text(viewModel.means[i])
                }, color: viewModel.getColor(index: i))
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
