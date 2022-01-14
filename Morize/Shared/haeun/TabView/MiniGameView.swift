//
//  MiniGameView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct MiniGameView: View {
    @State var state = 0
    var body: some View {
        VStack{
            if state == 0 {
                Button(action: {
                    state = 1
                }) {
                    Text("카드 맞추기")
                }.padding()
                
                Button(action: {
                    state = 2
                }) {
                    Text("가로세로 낱말")
                }.padding()
                
                Button(action: {
                    state = 3
                }) {
                    Text("타이머 게임")
                }.padding()
            }
            else if state == 1 {
                MiniGame()
            }
            else if state == 2 {
                minigame2()
            }
            else if state == 3 {
                WelcomeView()
            }
        }
    }
}

struct MiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameView()
    }
}
