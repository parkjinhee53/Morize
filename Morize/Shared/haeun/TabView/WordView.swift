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
            // 설정버튼
            Button {
                showingNotification = true
            } label: {
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 20, height: 22, alignment: .center)
                    .foregroundColor(.black)
                // 알림이 있을 때
                Circle()
                    .frame(width: 12, height: 12, alignment: .center)
                    .foregroundColor(.green)
                    .padding(.leading, -15)
                    .padding(.top, -15)
            }
            .padding(.leading, 16)
            .fullScreenCover(isPresented: $showingNotification, content: {NotificationView()})
            
            Spacer()
            // View 이름으로 바꿀 것
            Text(UserName + "의 단어장")
                .font(.custom("GodoM", size: 20))
            
            Spacer()
            
            Button {
                self.showingSettings.toggle()
            } label: {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 16)
            .fullScreenCover(isPresented: $showingSettings, content: {SettingView()})
        }
        .padding(.top, 16)
    }
}
// 상단 탭 바

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
