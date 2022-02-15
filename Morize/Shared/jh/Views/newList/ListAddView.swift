//
//  ListAddView.swift
//  Morize
//
//  Created by judongseok on 2022/02/15.
//

import SwiftUI

struct ListAddView: View {
    @State var name: String = ""
    @State var mean: String = ""
    
    var vm = ListVM()
    
    var body: some View {
        VStack {
            Spacer()
            TextField("단어를 입력해 주세요.", text: $name)
                .font(.custom("GodoM", size: 15))
                .padding()
                .background(Color.init(hex: "#dddddd"))
                .cornerRadius(8)
            TextField("뜻을 입력해 주세요.", text: $mean)
                .padding()
                .background(Color.init(hex: "#dddddd"))
                .font(.custom("GodoM", size: 15))
                .cornerRadius(8)
            
            Spacer()
            
            Button {
                // 클릭 시 단어 리스트에 반영하고 db에 올리기
                vm.saveToDB(word: name, mean: mean)
                
            } label: {
                Text("단어 생성하기")
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .padding()
                    .background(Color.init(hex: "#81c147"))
                    .cornerRadius(8)
                    .font(.custom("GodoM", size: 20))
                    .tint(Color.white)
            }

        }
        .padding()
    }
}

struct ListAddView_Previews: PreviewProvider {
    static var previews: some View {
        ListAddView()
    }
}
