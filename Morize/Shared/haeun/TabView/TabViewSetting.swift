//
//  TabViewSetting.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct TabViewSetting: View {
    @Binding var level: String
    
    var body: some View {
        ZStack {
            Color(hex: "eaefe5")
                .ignoresSafeArea()
            VStack {
                // 상단 TabView
                WordView()
                // 하단 TabView
                TabView {
                    CardMemory()
                        .tabItem{
                            Image(systemName: "character.book.closed.fill")
                        }
                        .navigationBarHidden(false)
                    
                    ListView()
                        .tabItem{
                            Image(systemName: "book")
                       }
                       .navigationBarHidden(false)
                    
//                    if level == "middle" {
//                        MiddleWord()
//                            .tabItem{
//                                Image(systemName: "book")
//                            }
//                            .navigationBarHidden(false)
//                    }
//                    else if level == "high" {
//                        HighWord()
//                            .tabItem{
//                                Image(systemName: "book")
//                            }
//                            .navigationBarHidden(false)
//                    }
//                    else if level == "toeic" {
//                        ToeicWord()
//                            .tabItem{
//                                Image(systemName: "book")
//                            }
//                            .navigationBarHidden(false)
//                    }
                    MiniGameView()
                        .tabItem{
                            Image(systemName: "gamecontroller.fill")
                        }
                        .navigationBarHidden(false)
                }
                .accentColor(.black)
            }
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
