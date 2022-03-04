//
//  ListAddView.swift
//  Morize
//
//  Created by judongseok on 2022/02/15.
//

import SwiftUI

struct ListAddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var name: String = ""
    @State var mean: String = ""
    
    @ObservedObject var vm: ListVM
    
    var body: some View {
        VStack {
            TextField("단어를 입력해 주세요.", text: $name)
                .font(.custom("NotoSansKR-Medium", size: 17))
                .padding()
                .background(Color.init(hex: "#dddddd"))
                .cornerRadius(8)
                    .padding(.top, 50)
            TextField("뜻을 입력해 주세요.", text: $mean)
                .padding()
                .background(Color.init(hex: "#dddddd"))
                .font(.custom("NotoSansKR-Medium", size: 17))
                .cornerRadius(8)
                .padding(.top, 10)
            
            Spacer()
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("취소")
                        .frame(width: UIScreen.main.bounds.width / 2 - 20)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .background(Color.init(hex: "#777777"))
                        .cornerRadius(8)
                        .font(.custom("NotoSansKR-Medium", size: 17))
                        .tint(Color.white)
                }
                
                Button {
                    // 클릭 시 단어 리스트에 반영하고 db에 올리기
                    vm.saveToDB(word: name, mean: mean)
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("단어 생성하기")
                        .frame(width: UIScreen.main.bounds.width / 2 - 20)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .background(Color.init(hex: "#008E00"))
                        .cornerRadius(8)
                        .font(.custom("NotoSansKR-Medium", size: 17))
                        .tint(Color.white)
                }
            }
            .padding(.bottom, 50)
        }
        .navigationBarHidden(true)
        .padding()
    }
}

//struct ListAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListAddView()
//    }
//}
