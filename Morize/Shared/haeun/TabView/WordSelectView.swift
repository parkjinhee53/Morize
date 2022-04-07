//
//  WordSelectView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/14.
//

import SwiftUI

struct WordSelectView: View {
    @AppStorage("level") var level : String = UserDefaults.standard.string(forKey: "level") ?? "none"
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                if level == "none" {
                    Text("저희 어플을 처음 사용하시나요 ?")
                        .foregroundColor(Color.init(hex: "008E00"))
                        .font(.custom("GodoM", size: 30))
                        .padding(.bottom, 10)
                        .padding(.leading, 20)
                        .padding(.top, 50)
                    Text("기본으로 제공되는 단어장의 종류를 선택해 주세요!")
                        .font(.custom("GodoM", size: 15))
                        .foregroundColor(Color.init(hex: "666666"))
                        .padding(.leading, 20)
                        .padding(.bottom, 50)
                    Spacer()
                    VStack(alignment: .center) {
                        Button(action: {
                            UserDefaults.standard.set("middle", forKey: "level")
                        }) {
                            VStack(alignment:. leading) {
                                Text("중등단어")
                                    .font(.custom("GodoM", size: 25))
                                    .padding(.bottom, 5)
                                    .foregroundColor(Color.init(hex: "1b2213"))
                                Text("Apple, Banana, Carrot...")
                                    .font(.custom("GodoM", size: 18))
                            }
                            .padding(.leading, 20)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 100, alignment: .leading)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .shadow(color: .gray, radius: 1, x: 0, y: 1)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .center) {
                        Button(action: {
                            UserDefaults.standard.set("high", forKey: "level")
                        }) {
                            VStack(alignment:. leading) {
                                Text("고등단어")
                                    .font(.custom("GodoM", size: 25))
                                    .padding(.bottom, 5)
                                    .foregroundColor(Color.init(hex: "1b2213"))
                                Text("Apple, Banana, Carrot...")
                                    .font(.custom("GodoM", size: 18))
                            }
                            .padding(.leading, 20)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 100, alignment: .leading)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .shadow(color: .gray, radius: 1, x: 0, y: 1)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .center) {
                        Button(action: {
                            UserDefaults.standard.set("toeic", forKey: "level")
                        }) {
                            VStack(alignment:. leading) {
                                Text("토익")
                                    .font(.custom("GodoM", size: 25))
                                    .padding(.bottom, 5)
                                    .foregroundColor(Color.init(hex: "1b2213"))
                                Text("Apple, Banana, Carrot...")
                                    .font(.custom("GodoM", size: 18))
                            }
                            .padding(.leading, 20)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 100, alignment: .leading)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .shadow(color: .gray, radius: 1, x: 0, y: 1)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 100)
                }
                else {
                    TabViewSetting(level: $level)
                }
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
}

struct WordSelectView_Previews: PreviewProvider {
    static var previews: some View {
        WordSelectView()
    }
}
