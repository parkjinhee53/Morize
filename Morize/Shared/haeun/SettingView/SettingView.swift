//
//  SettingView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/14.
//

import SwiftUI

struct SettingView: View {
    @State var state = 0
    var body: some View {
        VStack{
            if state == 0{
                Text("계정")
                Button(action : {
                    state = 1
                }){
                    Text("계정관리")
                }
                
                Text("지원")
                Button(action : {
                    state = 2
                }){
                    Text("공지사항 / 이벤트")
                }
                Button(action : {
                    state = 3
                }){
                    Text("iCloud 동기화")
                }
                Button(action : {
                    state = 4
                }){
                    Text("CSV 파일 등록하기 / 내보내기")
                }
                
                Text("문의")
                Button(action : {
                    state = 5
                }){
                    Text("자주 하는 질문")
                }
                Button(action : {
                    state = 6
                }){
                    Text("개발자에게 메일 보내기")
                }
                
            }
            else if state == 1 {
                AccountManagement()
            }
            else if state == 2 {
                NoticeView()
            }
            else if state == 3 {
                iCloudDataView()
            }
            else if state == 4 {
                CSVDataView()
            }
            else if state == 5 {
                FAQView()
            }
            else if state == 6 {
                SendEmailView()
            }
            //로그인 정보가 들어있는 값에 따라서 카카오, 구글, 애플중에 고르기
            Button(action : {
                
            }){
                Text("로그아웃")
            }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
