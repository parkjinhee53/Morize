//
//  CardFlip.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/05.
//

import SwiftUI

struct CardFlipTutorial: View {
    @ObservedObject var viewModel = CardFlipVM()
    @State var arrowAnimation = false
    @State var clickAnimation = true
    @State var description = "드래그로 카드를 넘길 수 있습니다."
    @State var buttonText = "다음"
    @State var clickOpacity = 0.0
    @State var arrowOpacity = 1.0
    @State var animationAmount: CGFloat = 1
    @State var rotationAmount: CGFloat = 0

    var body: some View {
        VStack{
            Text(description)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.top, 50)
            ZStack{
                Flashcard(front: {
                    Text("Apple")
                }, back: {
                    Text("사과")
                }, color: viewModel.getColor(index: 0),
                click: false, tutorial: false)
                    .padding(.top, 150)
                    .offset(CGSize(width: 0, height: animationAmount))
                    .zIndex(WordStorage.shared.zIndexs[0])
                    .onAppear(perform: {
                        if !arrowAnimation {
                            animationAmount = -50
                        }
                        else {
                            animationAmount = 0
                        }
                    })
                    .if(!arrowAnimation) { view in
                        view.animation(Animation.easeInOut(duration: 0.5).delay(0.3).repeatForever(), value: animationAmount)
                    }
                        
                Flashcard(front: {
                    Text("Banana")
                }, back: {
                    Text("바나나")
                }, color: viewModel.getColor(index: 1), click: false, tutorial: arrowAnimation)
                    .padding(.top, 150)
                    .offset(WordStorage.shared.dragOffset[1])
                    .zIndex(WordStorage.shared.zIndexs[1])
                    .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
                    
                
                LottieView(filename: "arrow", isPaused: arrowAnimation)
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
                    UserDefaults.standard.set(false, forKey: "isFirst") 
                }
                // 상하 위치 0 으로, 로테이션 180으로, 화살표 애니메이션 false, 클릭 애니메이션 true
                // 클릭 애니메이션 opacity=1, 화살표 애니메이션 opacity=0
                arrowAnimation = true
                clickAnimation = false
                clickOpacity = 1
                arrowOpacity = 0
                description = "클릭으로 카드를 뒤집을 수 있습니다."
                buttonText = "확인"
                WordStorage.shared.zIndexs[0] = -1
            } label: {
                Text(buttonText)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
        }
    }
}
