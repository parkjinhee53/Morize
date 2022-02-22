//
//  MorizeApp.swift
//  Shared
//
//  Created by 김하은 on 2021/12/28.
//

import SwiftUI
import Foundation
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct MorizeApp: App {
    @StateObject var userAuth: GoogleDelegate = GoogleDelegate()
    @StateObject var kakaoAuth: AppDelegate = AppDelegate()
    init() {
        UserDefaults.standard.set("로그인", forKey: "UserName")
        KakaoSDK.initSDK(appKey: "67ccb1551072d256d2a37ebef4b61bfd")
    }
    var body: some Scene {
        WindowGroup {
//            LoginView()
//                .environmentObject(self.userAuth)
//                .environmentObject(self.kakaoAuth)
            MiniGame2B(currentPage: .constant(Pages.GamePage),savePhotos:.constant(false))
            
        }
    }
}
