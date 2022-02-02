//
//  AccountManagement.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

// 계정관리

struct AccountManagement: View {
    @AppStorage("UserName") var UserName : String = UserDefaults.standard.string(forKey: "UserName") ?? "사용자"
    @EnvironmentObject var googledel: GoogleDelegate
    @EnvironmentObject var kakaodel: AppDelegate   // kakao AppDelegate 함수 공유
    
    var body: some View {
        VStack{
            LabelledDivider(label: UserName)
            //로그인 정보가 들어있는 값에 따라서 카카오, 구글, 애플중에 고르기
            
            // 로그아웃 클릭할 때 한번에 되는지 확인 필요
            Button(action : {
                // kakao 로그아웃
                kakaodel.kakaosignout()
                // google 로그아웃
                googledel.signOut()
            }){
                Text("로그아웃")
            }
            Button(action : {
                
            }){
                Text("개인정보처리방침")
            }
            // 회원탈퇴가 필요할 지 상의 필요
//            Button(action : {
//                
//            }){
//                Text("회원탈퇴")
//            }
        }
    }
}
struct AccountManagement_Previews: PreviewProvider {
    static var previews: some View {
        AccountManagement()
    }
}
