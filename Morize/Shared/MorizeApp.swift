//
//  MorizeApp.swift
//  Shared
//
//  Created by 김하은 on 2021/12/28.
//

import SwiftUI
import Foundation

@main
struct MorizeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var userAuth: GoogleDelegate = GoogleDelegate()
    init() {
        UserDefaults.standard.set("로그인", forKey: "UserName")
        UserDefaults.standard.set(true, forKey: "isFirst")
    }
    var body: some Scene {
        WindowGroup {
            CardMemory()
//            LoginView()
//                .environmentObject(self.userAuth)
        }
    }
}
