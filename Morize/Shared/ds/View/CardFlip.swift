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

struct Flashcard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    var color: Color
    
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back, color: Color) {
        self.front = front
        self.back = back
        self.color = color
    }
    
    var body: some View {
        ZStack {
            if flipped {
                back()
            }
            else {
                front()
            }
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .font(.system(size: 30, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .frame(width: 300, height: 250, alignment: .center)
        .background(color)
        .cornerRadius(30)
        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.15), radius: 15, x: 0, y: 0)
        .onTapGesture {
            flipFlashcard()
        }
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipFlashcard(){
        let animationTime = 0.3
        withAnimation(Animation.linear(duration: animationTime)) {
            if flipped {
                flashcardRotation += 180
            }
            else {
                flashcardRotation -= 180
            }
            flipped.toggle()
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation -= 180
        }
    }
}

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
