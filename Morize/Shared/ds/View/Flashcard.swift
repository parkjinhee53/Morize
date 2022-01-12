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
        .font(.system(size: 30, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .frame(width: 300, height: 250, alignment: .center)
        .background(color)
        .cornerRadius(30)
        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.15), radius: 15, x: 0, y: 0)
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
