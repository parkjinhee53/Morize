//
//  MainTabView.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            WelcomeView()
                .tabItem { Label("Game", systemImage: "gamecontroller") }
//            WordList()
//                .tabItem { Label("List", systemImage: "list") }
            ControlsView()
                .tabItem { Label("Controls", systemImage: "gear") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
