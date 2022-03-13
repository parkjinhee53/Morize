//
//  MiniGameIntro.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/03/11.
//

import SwiftUI

struct MiniGameIntro: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var start = false
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("단어 맞추기")
                .foregroundColor(Color.init(hex: "008E00"))
                .font(.custom("NotoSansKR-Bold", size: 40))
                .padding(.bottom, 30)
                .padding(.leading, 16)
            
            Text("영어 단어와 일치하는 뜻을 순서대로 클릭하면 카드가 사라집니다.")
                .font(.custom("NotoSansKR-Regular", size: 16))
                .padding(.bottom, 1)
                .padding(.leading, 16)
                .foregroundColor(.black)
            Text("모든 카드를 없애면 게임 클리어 :)")
                .font(.custom("NotoSansKR-Regular", size: 18))
                .padding(.leading, 16)
                .foregroundColor(.black)
            Spacer()
            
            HStack {
                Button("뒤로가기") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .font(.custom("NotoSansKR-Bold", size: 20))
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                .background(Color.init(hex: "666666"))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 50)
                .padding(.leading, 16)
                Spacer()
                Button("시작하기") {
                    print("asdf")
                    start = true
                }
                .fullScreenCover(isPresented: $start, content: MiniGame.init)
                .font(.custom("NotoSansKR-Bold", size: 20))
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                .background(Color.init(hex: "008E00"))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 50)
                .padding(.trailing, 16)
            }
        }
        .navigationBarHidden(true)
    }
}

struct MiniGameIntro_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameIntro()
    }
}
