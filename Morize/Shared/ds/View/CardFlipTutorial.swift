//
//  CardFlip.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/05.
//

import SwiftUI

struct CardFlipTutorial: View {
    @ObservedObject var viewModel = CardFlipVM()
    @Binding var isFirst: Bool
    @State var arrowAimation = false
    @State var clickAnimation = true
    @State var description = "드래그로 카드를 넘길 수 있습니다."
    @State var buttonText = "다음"
    @State var clickOpacity = 0.0
    @State var arrowOpacity = 1.0
    var body: some View {
        VStack{
            Text(description)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.top, 50)
            ZStack{
                ForEach(0..<viewModel.getWordsCount()) { i in
                    Flashcard(front: {
                        Text(viewModel.words[i])
                    }, back: {
                        Text(viewModel.means[i])
                    }, color: viewModel.getColor(index: i))
                        .padding(.top, 150)
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
                LottieView(filename: "arrow", isPaused: arrowAimation)
                    .frame(width: 200, height: 200, alignment: .top)
                    .offset(x: 0, y: -180)
                    .rotationEffect(.degrees(-180))
                    .opacity(arrowOpacity)
                
                LottieView(filename: "click", isPaused: clickAnimation)
                    .frame(width: 200, height: 200, alignment: .top)
                    .offset(x: 0, y: 120)
                    .opacity(clickOpacity)
            }
            Spacer()
            Button {
                if buttonText == "확인" {
                    isFirst = false
                }
                
                arrowAimation = true
                clickAnimation = false
                clickOpacity = 1
                arrowOpacity = 0
                description = "클릭으로 카드를 뒤집을 수 있습니다."
                buttonText = "확인"
            } label: {
                Text(buttonText)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
        }
    }
}
