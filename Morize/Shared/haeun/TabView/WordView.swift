//
//  WordView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct WordView: View {
    @AppStorage("UserName") var UserName : String = UserDefaults.standard.string(forKey: "UserName") ?? "사용자"
    @State var showingSettings = false
    @State var showingNotification = false
    
    var body: some View {
        HStack {
            // View 이름으로 바꿀 것
            Text(UserName + "의 단어장")
                .padding()
            
            // 알림버튼
            Button(action: {
                // View 보여주기
                showingNotification = true
            }
            ){
                Image(systemName: "bell")
            }.sheet(isPresented: $showingNotification) {
                NotificationView()
            }
            
            // 설정버튼
            Button(action: {
                // View 보여주기
                showingSettings = true
            })
            {
                Image(systemName: "gearshape")
            }.sheet(isPresented: $showingSettings){
                SettingView()
            }.padding(5)
            
        }
    }
}
// 상단 탭 바

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
