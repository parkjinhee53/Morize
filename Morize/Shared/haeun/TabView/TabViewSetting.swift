//
//  TabViewSetting.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct TabViewSetting: View {
    var body: some View {
        // 하단 TabView
        TabView {
            WordView()
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

// 상단 탭 바
struct HeaderTabView: View {
    var body: some View {
        HStack {
            Spacer()
            // View 이름으로 바꿀 것
            Text("제목")
                .foregroundColor(Color.blue)
            Spacer()
            
            // 설정버튼
            Button(action: {
                // View 보여주기
            }
            ){
                Image(systemName: "bell")
            }
            
            // 설정버튼
            Button(action: {
                // View 보여주기
            })
            {
                Image(systemName: "gearshape")
            }
        }
    }
}
