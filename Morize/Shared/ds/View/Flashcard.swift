//
//  Flashcard.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/10.
//

import SwiftUI

struct Flashcard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    var color: Color
    var canClick = true
    var tutorial = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 1
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back, color: Color, click: Bool, tutorial: Bool) {
        self.front = front
        self.back = back
        self.color = color
        self.canClick = click
        self.tutorial = tutorial
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
        .font(.custom("GodoM", size: 35))
        .foregroundColor(.white)
        .frame(width: 250, height: 180, alignment: .center)
        .background(Color.init(hex: "008E00"))
        .cornerRadius(16)
        .onTapGesture {
            if canClick{
                flipFlashcard()
            }
        }
        .onReceive(timer) { input in
            if tutorial{
                count += 1
                if count >= 2{
                    count = 0
                    flipFlashcard()
                }
            }
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
