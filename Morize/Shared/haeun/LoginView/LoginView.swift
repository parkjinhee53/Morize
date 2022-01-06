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

struct LoginView: View {
    var body: some View {
        
        Text("Morize")
        
        // 소셜 로그인 부분
        
        HStack{
            Button(action : {
                // 카카오톡 설치 여부 확인
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
                else {
                    print("카카오톡 미설치")
                }
//                else{
//                    // 카카오톡이 설치되어 있지 않으면 사파리를 통한 로그인 진행
//                    UserApi.shared.loginWithKakaoAccount{(oauthToken, error) in
//                        print(oauthToken?.accessToken)
//                        print(error)
//                    }
//                }
            }){
                Text("카카오 로그인")
            }
            .onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            })
            
            Button(action: {
                
            }) {
                Text("네이버")
                    .font(.headline)
                    .padding()
            }.padding()
            
            Button(action: {
                
            }) {
                Text("구글")
                    .font(.headline)
                    .padding()
            }.padding()
            
            Button(action: {
                
            }) {
                Text("애플")
                    .font(.headline)
                    .padding()
            }.padding()
        }
        
        // morize 서버 로그인 부분
        HStack{
            // 회원가입 버튼
            Button(action: {
//                SignUpView()
            }){
                Text("signup")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
