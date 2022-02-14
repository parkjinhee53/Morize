//
//  SettingView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/14.
//

import SwiftUI
import MessageUI


struct SettingView: View {
    @Environment(\.presentationMode) var presentationmode
    @State private var mailData = ComposeMailData(subject: "Morize 개발자에게",
                                                  recipients: ["haeunkim0807@naver.com"],
                                                  attachments: [AttachmentData(data: "Some text".data(using: .utf8)!,
                                                  mimeType: "text/plain",
                                                  fileName: "text.txt")])
    @State private var showMailView = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Button {
                    print("asdf")
                    self.presentationmode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                }
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 0))
                Spacer()
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
                        Text("CSV 파일 가져오기 / 내보내기")
                    }
                    LabelledDivider(label: "문의")
                    NavigationLink(destination: FAQView()) {
                        Text("자주 하는 질문")
                    }
                    // Navigation으로 바꿀 방법 찾아보기
                    Button(action: {
                        showMailView = true
                     }) {
                         Text("개발자에게 메일 보내기")
                     }
                     .disabled(!SendEmail.canSendMail)
                     .sheet(isPresented: $showMailView) {
                         SendEmail(maildata: $mailData) { result in
                             print(result)
                         }
                     }
                }
            }
            .navigationBarHidden(true)
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
