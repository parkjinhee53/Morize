//
//  CardFlip.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/05.
//

import SwiftUI

struct CardFlip: View {
    @ObservedObject var viewModel = CardFlipVM()
    @State var flipped: [Bool] = [false, false, false, false]
    var body: some View {
        ZStack{
            ForEach(0..<viewModel.getWordsCount()) { i in
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(LinearGradient(gradient: Gradient(colors: viewModel.getColor(index: i)), startPoint: .top, endPoint: .bottomTrailing))
                        .frame(width: 300, height: 250, alignment: .center)
                    Text(viewModel.words[i])
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                }
                .rotation3DEffect(self.flipped[i] ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                .offset(viewModel.dragOffset[i])
                .onTapGesture {
                    // explicitly apply animation on toggle (choose either or)
                    withAnimation {
                        self.flipped[i].toggle()
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            viewModel.dragOffset[i] = CGSize(width: gesture.translation.width, height: 0)
                        }
                        .onEnded { gesture in
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
