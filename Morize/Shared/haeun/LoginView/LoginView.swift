//
//  LoginView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI
// 소셜 로그인 (카카오톡, 네이버, 구글, 애플)
import KakaoSDKUser
import KakaoSDKAuth
import GoogleSignIn
import KakaoSDKCommon

struct LoginView: View {
    @State var member = UserInfo.init()    // 로그인 관련 init 파일
    @EnvironmentObject var googledel: GoogleDelegate
    @EnvironmentObject var kakaodel: AppDelegate   // kakao AppDelegate 함수 공유
    @AppStorage("UserName") var UserName : String = UserDefaults.standard.string(forKey: "UserName") ?? ""
    @AppStorage("isLogin") var isLogin : Bool = UserDefaults.standard.bool(forKey: "isLogin") 
    var body: some View {
        if isLogin{
            WordSelectView()
        }
        else {
            VStack{
                Text("Morize")
                Text(UserName)
                // 소셜 로그인 부분
                
                HStack{
                    // kakao login
                    Button(action : {
                        kakaodel.kakaocheck()
                    }){
                        Image("kakaolink_btn_small")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .padding()
                    
                    // google login
                    Button(action: {
                        googledel.signIn()
                    }) {
                        Image("btn_google_light_normal_ios")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }.padding()
                    
                    // apple login
                    //            AppleDelegate(.signIn,
                    //                onRequest: { (request) in
                    //                //Set up request
                    //                },
                    //                onCompletion: { (result) in
                    //                switch result {
                    //                case .success(let authorization):
                    //                    //Handle autorization
                    //                    break
                    //                case .failure(let error):
                    //                    //Handle error
                    //                    break
                    //                }
                    //
                    //        }.signInWithAppleButtonStyle(.black)
                    //        .padding()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
