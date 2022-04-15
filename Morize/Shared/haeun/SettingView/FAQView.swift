//
//  FAQView.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

struct FAQView: View {
    @Environment(\.presentationMode) var presentationmode
    
    var body: some View {
        NavigationView {
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
                    LabelledDivider(label: "자주 하는 질문", image: "questionmark.circle")
                    Group {
                        HStack(alignment: .center, spacing: 15) {
                            Text("1. CSV 파일 가져오기 / 내보내기는 무엇인가요?")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 17))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 2, trailing: 20))
                        HStack {
                            Text("CSV 파일 가져오기는 파일 형식으로 되어 있는 것을 자신의 단어장으로 가져오는 것이고 내보내기는 자신의 단어장에 있는 단어를 파일 형식으로 내보내는 것입니다.")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 17))
                                .padding(.leading, 30)
                        }
                        
                        Divider()
                            .frame(width: 350)
                            .foregroundColor(Color.init(hex: "666666"))
                        
                        HStack {
                            Text("2. 리스트에 추가한 단어는 어떻게 삭제하나요?")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 17))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 2, trailing: 20))
                        HStack {
                            Text("리스트 추가할 때 눌렀던 별 모양을 다시 한번 누르면 삭제됩니다.")
                        }
                        Divider()
                            .frame(width: 350)
                            .foregroundColor(Color.init(hex: "666666"))
                    }
                    
                    Group {
                        HStack {
                            Text("3. 아이폰에서 단어 리스트가 보이지 않습니다.")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 17))
                
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 2, trailing: 20))
                        HStack {
                            Text("OS 문제로 가끔 리스트가 보이지 않는 경우가 있습니다. 이런 경우에는 기기를 재시작하시거나 앱을 여러 번 실행해주세요.")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 17))
                                .padding(.leading, 23)
                        }
                        Divider()
                            .frame(width: 350)
                            .foregroundColor(Color.init(hex: "666666"))
                        
                        HStack(alignment: .center, spacing: 15) {
                            Text("궁금한 점이 아직 있으신가요?")
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 17))
                        }
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 3, trailing: 20))

                        NavigationLink(destination: FAQView2()) {
                            Text("문의하기")
                                .foregroundColor(Color.init(hex: "008E00"))
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

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
