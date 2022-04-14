//
//  NoticeView.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

// 공지사항, 이벤트
struct NoticeView: View {
    @Environment(\.presentationMode) var presentationmode
    
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
                ScrollView {
                    LabelledDivider(label: "공지사항 / 이벤트", image: "megaphone")
                    Group {
                        HStack(alignment: .center, spacing: 15) {
                            Spacer()
                            Text("22/4/13")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                                .padding(6)
                        }
                        HStack(alignment: .center, spacing: 15) {
                            Spacer()
                            Text("앞으로 더 나은 모리즈를 만들기 위해 설문을 진행하려고 합니다. 모리즈를 사용하시면서 좋았던 점 또는 불편했던 점 모두 적어주시면 감사하겠습니다. 설문이 끝난 후에는 이를 반영하여 업데이트에 참고하겠습니다. 감사합니다.")
                                .padding(.trailing)
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 16))
                        }
                        
                        Divider()
                            .frame(width: 350)
                            .foregroundColor(Color.init(hex: "666666"))
                        
                        HStack(alignment: .center, spacing: 15) {
                            Spacer()
                            Text("22/2/4")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                                .padding(6)
                        }
                        HStack(alignment: .center, spacing: 15) {
                            Text("계정과 비밀번호는 소중한 정보입니다. 개인 정보는 나만의 정보이기에 다른 사람이 알 수 없도록 주기적으로 비밀번호를 바꾸는 것을 권장드립니다. 감사합니다.")
                                .padding(.leading, 21)
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 16))
                        }
                        Divider()
                            .frame(width: 350)
                    }
                    Group {
                        HStack(alignment: .center, spacing: 15) {
                            Spacer()
                            Text("21/12/14")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                                .padding(6)
                        }
                        HStack(alignment: .center, spacing: 15) {
                            Text("현재 국내 통신사 문제로 인해 미니 게임 기능에 제한이 있습니다. 상황을 계속 지켜보면서 이 문제를 빠르게 해결할 수 있도록 방안을 찾겠습니다. 문제가 해결되면 바로 공지하겠습니다. 감사합니다.")
                                .padding(.leading)
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 16))
                        }
                        Divider()
                            .frame(width: 350)
                        
                        HStack(alignment: .center, spacing: 15) {
                            Spacer()
                            Text("21/12/1")
                                .font(.custom("NotoSansKR-Regular", size: 16))
                                .foregroundColor(Color.init(hex: "666666"))
                            Spacer()
                                .padding(6)
                        }
                        HStack(alignment: .center, spacing: 15) {
                            Text("앞으로 모리즈 공지사항은 이곳을 통해 전달드릴 예정입니다. 영어 단어를 쉽고 재밌게 외울 수 있도록 도와드리겠습니다. 감사합니다.")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 16))
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
