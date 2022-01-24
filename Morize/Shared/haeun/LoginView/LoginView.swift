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
            ZStack {
                // 이미지를 넣는 경우
//                Image("PaperBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
                // 색을 넣는 경우
                Color(hex: "eaefe5")
                    .ignoresSafeArea()
                
                // 이미지의 경우
                Image("bookman")
                    .resizable()
                    .frame(width: 380, height: 400, alignment: .center)
                    .padding(.top, 30)
                    .padding(.trailing, -90)
                
//                LottieView(filename: "plant", isPaused: false)
//                    .frame(width: 300, height: 300, alignment: .trailing)
//                    .padding(.trailing, -150)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("당신이 찾는")
                            .font(.custom("GodoM", size: 40))
                        ZStack{
                            Rectangle()
                                .frame(width: 120, height: 10, alignment: .center)
                                .padding(.leading, 120)
                                .padding(.top, 6)
                                .foregroundColor(Color.init(hex: "#81C147"))
                            Text("하나뿐인 단어장")
                                .font(.custom("GodoM", size: 40))
                                .padding(.top, -20)
                                .frame(width: 300, alignment: .leading)
                        }
                        Text("MORIZE")
                            .font(.custom("GodoB", size: 50))
                            .padding(.top, 20)
                            .foregroundColor(Color.init(hex: "#5e9f24"))
                    }
                    .padding(.top, 50)
                    .padding(.leading, 20)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    Spacer()
                    // 1안
//                    HStack {
//                        Rectangle()
//                            .frame(width: 130, height: 2, alignment: .center)
//                            .padding(.leading, 16)
//                            .foregroundColor(Color.init(hex: "1b2213"))
//                        Spacer()
////                        Text(UserName)
////                            .font(.custom("GodoM", size: 13))
//
//                        Text("소셜로그인")
//                            .font(.custom("GodoM", size: 15))
//                        Spacer()
//                        Rectangle()
//                            .frame(width: 130, height: 2, alignment: .center)
//                            .padding(.trailing, 16)
//                            .foregroundColor(Color.init(hex: "2b3e1d"))
//                    }
                    
                    // 2안
                    HStack {
                        VStack(alignment: .leading) {
                            Text("모리즈와 함께")
                                .font(.custom("GodoM", size: 20))
                            Text("영어단어 더욱 쉽게 외워봐요 :)")
                                .font(.custom("GodoM", size: 20))
                        }
                        .padding(.leading, 20)
                    }
                    
                    // 소셜 로그인 부분
                    VStack(alignment: .center) {
                        VStack{
                            // kakao login
                            Button(action : {
                                kakaodel.kakaocheck()
                            }){
                                VStack {
                                    ZStack(alignment: .center) {
                                        Image("kakao_login_large_wide")
                                            .resizable()
                                            .frame(height: 55)
                                        Text("카카오계정으로 시작하기")
                                            .foregroundColor(.black)
                                            .padding(.leading, UIScreen.main.bounds.width * 0.05)
                                    }
                                }
                            }
                            
                            // google login
                            Button(action: {
                                googledel.signIn()
                            }) {
                                VStack {
                                    ZStack(alignment: .center) {
                                        Image("google_login_large_wide")
                                            .resizable()
                                            .frame(height: 55)
                                        Text("구글 계정으로 시작하기")
                                            .foregroundColor(.black)
                                            .padding(.leading, UIScreen.main.bounds.width * 0.05)
                                    }
                                }
                            }
                        }
                        .padding(20)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
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
