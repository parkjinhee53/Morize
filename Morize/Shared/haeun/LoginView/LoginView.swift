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
import Lottie

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
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    // MORIZE -> Morize로 수정
                    Text("Morize")
                        .font(.custom("NotoSansKR-Black", size: 60))
                        .padding(.top, 20)
                        .foregroundColor(Color.init(hex: "#008E00"))
                }
                .padding(.top, 150)
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                
                HStack {
                    Group {
                    Text("The one and only vocabulary With ")
                        .font(.custom("NotoSansKR-Bold", size: 18))
                        .foregroundColor(Color.init(hex: "777777")) +
                    Text("Morise")
                        .font(.custom("NotoSansKR-Bold", size: 18))
                        .foregroundColor(Color.init(hex: "008E00"))
                    }
                    .multilineTextAlignment(.center)
                }
                Spacer()
                // 소셜 로그인 부분
                VStack(alignment: .center) {
                    Text("Get started social login with:")
                        .font(.custom("NotoSansKR-Bold", size: 13))
                        .foregroundColor(Color.init(hex: "555555"))
                    HStack{
                        // apple login
                        Button(action: {
                            //apple Login
                        }) {
                            VStack {
                                ZStack(alignment: .center) {
                                    Image("Logo - SIWA - Logo-only - White")
                                        .resizable()
                                        .cornerRadius(4)
                                        .frame(width: 42, height: 42, alignment: .center)
                                        .shadow(color: Color.init(hex: "bcbcbc"), radius: 1, x: 0, y: 2)
                                }
                            }
                        }
                        
                        // kakao login
                        Button(action : {
                            kakaodel.kakaocheck()
                        }){
                            VStack {
                                ZStack(alignment: .center) {
                                    Image("kakaolink_btn_small")
                                        .resizable()
                                        .frame(width: 42, height: 42, alignment: .center)
                                        .shadow(color: Color.init(hex: "bcbcbc"), radius: 1, x: 0, y: 2)
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        
                        // google login
                        Button(action: {
                            googledel.signIn()
                        }) {
                            VStack {
                                ZStack(alignment: .center) {
                                    Image("btn_google_light_normal_ios")
                                }
                            }
                        }
                    }
                    .padding(.bottom, 50)
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
