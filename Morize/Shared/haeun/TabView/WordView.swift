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
        ZStack {
            Spacer()
            // View 이름으로 바꿀 것
            Text(UserName + "의 단어장")
                .padding()
            
            // 설정버튼
            Button {
                showingNotification = true
            } label: {
                Image(systemName: "bell")
            }
            .padding(.leading, UIScreen.main.bounds.width * 0.75)
            .sheet(isPresented: $showingNotification) {
                NotificationView()
            }
            
            Button {
                self.showingSettings.toggle()
            } label: {
                Image(systemName: "gearshape")
            }
            .padding(.leading, UIScreen.main.bounds.width * 0.9)
            .fullScreenCover(isPresented: $showingSettings, content: {SettingView()})
        }
    }
}
// 상단 탭 바

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
