//
//  FAQView2.swift
//  Morize
//
//  Created by Jinhee on 2022/04/15.
//

import SwiftUI

struct FAQView2: View {
    @Environment(\.presentationMode) var presentationmode
    @State var faq = ""
    
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
                //Spacer()
                
                LabelledDivider(label: "문의하기", image: "questionmark.circle")
                
                HStack {
                    Text("내용")
                        .padding(25)
                        .foregroundColor(.black)
                }
                
                TextField("문의할 내용을 적어주세요.", text: $faq)
                    .keyboardType(.default)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                    .padding(15)
                Spacer()
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("취소")
                    }
                    .font(.custom("NotoSansKR-Bold", size: 20))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                    .background(Color.init(hex: "666666"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 50)
                    .padding(.leading, 16)
                    
                    Button(action: {
                        
                    }) {
                        Text("등록")
                            .foregroundColor(.white)
                    }
                    .font(.custom("NotoSansKR-Bold", size: 20))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                    .background(Color.init(hex: "008E00"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 50)
                    .padding(.leading, 16)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

struct FAQView2_Previews: PreviewProvider {
    static var previews: some View {
        FAQView2()
    }
}
