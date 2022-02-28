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
        HStack(alignment: .center) {
//            Button {
//                showingNotification = true
//            } label: {
//                Image(systemName: "bell.fill")
//                    .resizable()
//                    .frame(width: 20, height: 22, alignment: .center)
//                    .foregroundColor(.black)
//                // 알림이 있을 때
//                Circle()
//                    .frame(width: 12, height: 12, alignment: .center)
//                    .foregroundColor(.green)
//                    .padding(.leading, -15)
//                    .padding(.top, -15)
//            }
//            .padding(.leading, 16)
//            .fullScreenCover(isPresented: $showingNotification, content: {NotificationView()})
            
            // View 이름으로 바꿀 것
            VStack(alignment: .leading) {
                HStack {
                    Text(UserName)
                        .font(.custom("NotoSansKR-Bold", size: 23))
                        .foregroundColor(Color.init(hex: "008E00"))
                    Text("'s")
                        .font(.custom("NotoSansKR-Bold", size: 23))
                        .foregroundColor(Color.init(hex: "333333"))
                }
                Text("Vocabulary")
                    .font(.custom("NotoSansKR-Bold", size: 20))
                    .foregroundColor(Color.init(hex: "333333"))
            }
            
            Spacer()
            
            // 설정버튼
            Button {
                self.showingSettings.toggle()
            } label: {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .foregroundColor(Color.init(hex: "008E00"))
            }
            .fullScreenCover(isPresented: $showingSettings, content: {SettingView()})
        }
        .padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 30))
    }
}
// 상단 탭 바

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
