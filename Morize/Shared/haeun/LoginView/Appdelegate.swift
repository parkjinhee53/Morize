//
//  Appdelegate.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/06.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


class AppDelegate: NSObject, UIApplicationDelegate {
    @State var member = UserInfo.init()    // 로그인 관련 init 파일
    
    // kakao 초기화 과정
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        KakaoSDK.initSDK(appKey: "67ccb1551072d256d2a37ebef4b61bfd")

        return true
    }
    // kakao 로그인시 url열기 위해 필요함
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        return false
    }
    
    // kakao userInfo
    func setKakaoUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
//                self.member.username = (user?.kakaoAccount?.profile?.nickname)!!
                UserDefaults.standard.set((user?.kakaoAccount?.profile?.nickname)!!, forKey: "UserName")
            }
        }
    }
}
