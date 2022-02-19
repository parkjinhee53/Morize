//
//  MiniGameView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct MiniGameView: View {
    @State var state = 0
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: MiniGame()) {
                    Text("카드 맞추기")
                }
                .padding()
                NavigationLink(destination: MiniGame2B()) {
                    Text("가로세로 낱말")
                }
                .padding()
                NavigationLink(destination: WelcomeView()) {
                    Text("타이머 게임")
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct MiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameView()
    }
}
