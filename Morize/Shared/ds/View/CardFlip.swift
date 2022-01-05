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
                        .shadow(color: .gray, radius: 25, x: -10, y: 10)
                    Text(viewModel.words[i])
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                }
                .offset(viewModel.dragOffset[i])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            viewModel.dragOffset[i] = CGSize(width: gesture.translation.width, height: 0)
                        }
                        .onEnded { gesture in
                            print(viewModel.dragOffset[i].width)
                            // 왼쪽인가 ? -150
                            if viewModel.dragOffset[i].width <= -130 {
                                withAnimation(Animation.easeInOut(duration: 0.1)) {
                                    viewModel.dragOffset[i] = CGSize(width: -400, height: 0)
                                }
                            }
                            else if viewModel.dragOffset[i].width >= 130 {
                                withAnimation(Animation.easeInOut(duration: 0.1)) {
                                    viewModel.dragOffset[i] = CGSize(width: 400, height: 0)
                                }
                            }
                            else{
                                // 오른쪽인가 ? +150
                                viewModel.dragOffset[i] = .zero
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
