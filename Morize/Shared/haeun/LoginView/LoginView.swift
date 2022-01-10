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
    @State var nickName: String = "로그인"
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    var body: some View {
        
        Text("Morize")
        Text(nickName)
        // 소셜 로그인 부분
        
        HStack{
            Button(action : {
                // 카카오톡 설치 여부 확인
                if (UserApi.isKakaoTalkLoginAvailable()) {
                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                        if let error = error {
                            // 예외 처리 (로그인 취소 등등)
                            print(error)
                        }
                        else {
                            print("loginWithKakaoTalk() success.")
                            
                            //do something
                            // 회원가입 성공 시 oauthToken 저장
                             _ = oauthToken
                            let accessToken = oauthToken?.accessToken
                                            
                            // 카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                            self.setKakaoUserInfo()
                            
                        }
                    }
                }
                else {
                    print("카카오톡 미설치")
                    UserApi.shared.loginWithKakaoAccount{(oauthToken, error) in
                        print(oauthToken?.accessToken)
                        print(error)
                    }
                }
            }){
                Image("kakaolink_btn_small")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            })
            .padding()
            
            Button(action: {
                
            }) {
                Image("btn_google_light_normal_ios")
                    .resizable()
                    .frame(width: 60, height: 60)
            }.padding()
            
            Button(action: {
                
            }) {
                Text("애플")
                    .font(.headline)
                    .padding()
            }.padding()
        }
    }
    
    func setKakaoUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                nickName = (user?.kakaoAccount?.profile?.nickname)!!

            }
        }
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
