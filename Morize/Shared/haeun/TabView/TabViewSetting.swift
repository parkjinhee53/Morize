//
//  TabViewSetting.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct TabViewSetting: View {
    @State private var currentTab = 0
    @Binding var level: String

    @State var words = WordStorage.shared.word
    @State var means = WordStorage.shared.mean
    @State var zIndexs = WordStorage.shared.zIndexs
    @State var flipped = WordStorage.shared.flipped
    @State var dragOffset = WordStorage.shared.dragOffset
    
    var body: some View {
        VStack {
            // 상단 TabView
            WordView()
            // 하단 TabView
            TabView {
                CardFlip(card: $words)
                    .tabItem{
                        Image(systemName: "note.text")
                    }
                    .navigationBarHidden(false)
                    .onAppear {
                        words = WordStorage.shared.word
                        means = WordStorage.shared.mean
                        zIndexs = WordStorage.shared.zIndexs
                        flipped = WordStorage.shared.flipped
                        dragOffset = WordStorage.shared.dragOffset
                        print(words)
                    }
                
                ListView()
                    .tabItem{
                        Image(systemName: "book")
                   }
                   .navigationBarHidden(false)
                
                MiniGameView()
                    .tabItem{
                        Image(systemName: "gamecontroller")
                    }
                    .navigationBarHidden(false)
            }
            .accentColor(Color(hex: "008E00"))
        }
    }
}
struct TabViewSetting_Previews: PreviewProvider {
    static var previews: some View {
        TabViewSetting(level: .constant("middle"))
    }
}

extension UITabBarController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()

        appearance.backgroundColor = .white
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .gray

//        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        self.tabBar.standardAppearance = appearance
    }
}
