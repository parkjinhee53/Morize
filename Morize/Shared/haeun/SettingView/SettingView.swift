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
                .foregroundColor(Color.init(hex: "008E00"))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                Spacer()
                ScrollView() {
                    Text("Settings")
                        .font(.custom("NotoSansKR-Bold", size: 25))
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 0))
                    
                    LabelledDivider(label: "계정", image: "person")
                    NavigationLink(destination: AccountManagement()) {
                        HStack {
                            Text("계정관리")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.init(hex: "666666"))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    }
                    LabelledDivider(label: "지원", image: "megaphone")
                    NavigationLink(destination: NoticeView()) {
                        HStack {
                            Text("공지사항 / 이벤트")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.init(hex: "666666"))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    }
                    NavigationLink(destination: iCloudDataView()) {
                        HStack {
                            Text("iCloud 동기화")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.init(hex: "666666"))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    }
                    NavigationLink(destination: CSVDataView()) {
                        HStack {
                            Text("CSV 파일 가져오기 / 내보내기")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.init(hex: "666666"))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    }
                    LabelledDivider(label: "문의", image: "questionmark.circle")
                    NavigationLink(destination: FAQView()) {
                        HStack {
                            Text("자주 하는 질문")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.init(hex: "666666"))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    }
                    // Navigation으로 바꿀 방법 찾아보기
                    Button(action: {
                        showMailView = true
                     }) {
                         HStack {
                             Text("개발자에게 메일 보내기")
                                 .font(.custom("NotoSansKR-Regular", size: 16))
                                 .foregroundColor(Color.init(hex: "666666"))
                             Spacer()
                             Image(systemName: "chevron.right")
                                 .foregroundColor(Color.init(hex: "666666"))
                         }
                         .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
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
    let image: String
    let horizontalPadding: CGFloat
    let color: Color
    
    init(label: String, image: String, horizontalPadding: CGFloat = 20, color: Color = .black) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
        self.image = image
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(Color.init(hex: "008E00"))
                    .frame(width: 18, height: 18, alignment: .center)
                    .padding(.trailing, 5)
                Text(label).foregroundColor(color)
                    .font(.custom("NotoSansKR-Bold", size: 18))
            }
            .frame(height: 23)
            line
                .background(.green)
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20))
    }
    
    var line: some View {
        VStack { Divider().background(color) }.padding(0)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
