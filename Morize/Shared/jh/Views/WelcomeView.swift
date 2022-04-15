//
//  WelcomeView.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import SwiftUI

// 첫 화면
struct WelcomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var start = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("타이머 게임")
                        .foregroundColor(Color.init(hex: "008E00"))
                        .font(.custom("NotoSansKR-Bold", size: 40))
                        .padding(.bottom, 30)
                        .padding(.leading, 16)
                    Text("질문에 대한 정답을 시간 안에 맞추면 됩니다.")
                        .font(.custom("NotoSansKR-Regular", size: 16))
                        .padding(.bottom, 1)
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
                        .fullScreenCover(isPresented: $start, content: TimerGame.init)
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
            }
        }
        .navigationBarHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
