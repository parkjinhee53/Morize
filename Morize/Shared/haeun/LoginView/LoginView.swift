//
//  LoginView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI
// 소셜 로그인 (카카오톡, 네이버, 구글, 애플)

struct LoginView: View {
    var body: some View {
        
        Text("Morize")
        
        // 소셜 로그인 부분
        
        HStack{
            Button(action: {
                
                }) {
                    Text("카카오톡")
                        .font(.headline)
                        .padding()
                }.padding()
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
                SignUpView()
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
