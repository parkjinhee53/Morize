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


class AppDelegate: ObservableObject {
    @State var member = UserInfo.init()    // 로그인 관련 init 파일
    
    // google userInfo
    func kakaocheckStatus(){
        UserApi.shared.me { user, error in
            if let error = error {
                print(error)
            }
            else {
                if user?.kakaoAccount?.profile?.nickname != nil {
                    let user = user?.kakaoAccount?.profile?.nickname!
                    guard let user = user else { return }
                    let userName = user
                    UserDefaults.standard.set(userName, forKey: "UserName")
                    UserDefaults.standard.set(true, forKey: "isLogin")
                    print(UserDefaults.standard.string(forKey: "UserName")!)
                }
                // UserID 저장
                print(user?.id!)
                UserDefaults.standard.set(user?.id!, forKey: "UserID")
            }
        }
    }
    
    func kakaocheck(){
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            
            self.kakaocheckStatus()
        }
    }
    
    // kakao userInfo
    func setKakaoUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            print("me() success.")
            //do something
            _ = user
//                self.member.username = (user?.kakaoAccount?.profile?.nickname)!!
            let userName = user?.kakaoAccount?.profile?.nickname
            
            UserDefaults.standard.set(userName, forKey: "UserName")
        }
    }
    
    func kakaosignIn(){
        guard ((UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController) != nil else {return}
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    func kakaosignout(){
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
}
