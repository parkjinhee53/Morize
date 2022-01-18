//
//  TabViewSetting.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct TabViewSetting: View {
    var body: some View {
        // 상단 TabView
        WordView()
        // 하단 TabView
        TabView {
            CardMemory()
                .tabItem{ Text("Word")  }
                .navigationBarHidden(false)
            WordListView()
                .tabItem{ Text("List") }
                .navigationBarHidden(false)
            MiniGameView()
                .tabItem{ Text("Game") }
                .navigationBarHidden(false)
        }
    }
}
