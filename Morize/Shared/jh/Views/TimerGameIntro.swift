//
//  TimerGameIntro.swift
//  Morize
//
//  Created by judongseok on 2022/04/11.
//

import Foundation
import SwiftUI

struct TimerGameIntro: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var start = false
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("타이머 게임")
                .foregroundColor(Color.init(hex: "008E00"))
                .font(.custom("NotoSansKR-Bold", size: 40))
                .padding(.bottom, 30)
                .padding(.leading, 16)
            
            Text("5초안에 단어와 맞는 뜻을 선택하는 게임입니다.")
                .font(.custom("NotoSansKR-Regular", size: 16))
                .padding(.bottom, 1)
                .padding(.leading, 16)
                .foregroundColor(.black)
            Text("5개 문제를 모두 풀면 클리어 :)")
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
                .fullScreenCover(isPresented: $start, content: WelcomeView.init)
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

struct TimerGameIntro_Previews: PreviewProvider {
    static var previews: some View {
        TimerGameIntro()
    }
}
