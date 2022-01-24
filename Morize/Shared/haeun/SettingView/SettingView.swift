//
//  SettingView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/14.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LabelledDivider(label: "계정")
                NavigationLink(destination: AccountManagement()) {
                    Text("계정관리")
                }
                LabelledDivider(label: "지원")
                NavigationLink(destination: NoticeView()) {
                    Text("공지사항 / 이벤트")
                }
                NavigationLink(destination: iCloudDataView()) {
                    Text("iCloud 동기화")
                }
                NavigationLink(destination: CSVDataView()) {
                    Text("CSV 파일 등록하기 / 내보내기")
                }
                LabelledDivider(label: "문의")
                NavigationLink(destination: FAQView()) {
                    Text("자주 하는 질문")
                }
                NavigationLink(destination: SendEmailView()) {
                    Text("개발자에게 메일 보내기")
                }
            }
        }.navigationBarHidden(true)
        VStack{
            //로그인 정보가 들어있는 값에 따라서 카카오, 구글, 애플중에 고르기
            Button(action : {
                
            }){
                Text("로그아웃")
            }
        }
    }
}

// line 설정
struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .black) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
