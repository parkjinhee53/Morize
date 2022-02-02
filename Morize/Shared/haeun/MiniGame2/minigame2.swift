//
//  minigame2.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2021/12/29.
//

import SwiftUI
import AVFoundation

struct minigame2: View {
    @State private var cell01 = ""
    @State private var cell02 = ""
    @State private var cell03 = ""
    @State private var cell04 = ""
    @State private var cell05 = ""
    @State private var cell06 = ""
    @State private var cell07 = ""
    @State private var cell08 = ""
    @State private var cell09 = ""
    @State private var cell10 = ""
    @State private var cell11 = ""
    @State private var cell12 = ""
    @State private var cell13 = ""
    @State private var cell14 = ""
    @State private var cell15 = ""
    @State private var cell16 = ""
    @State private var cell17 = ""
    @State private var cell18 = ""
    @State private var cell19 = ""
    @State private var cell20 = ""
    @State private var cell21 = ""
    @State private var cell22 = ""
    @State private var cell23 = ""
    @State private var cell24 = ""
    @State private var cell25 = ""
    @State private var across1Correct = false
    @State private var across2Correct = false
    @State private var across3Correct = false
    @State private var across4Correct = false
    @State private var across5Correct = false
    @State private var across6Correct = false
    @State private var down1Correct = false
    @State private var down2Correct = false
    @State private var down3Correct = false
    @State private var down4Correct = false
    @State private var down5Correct = false
    
    var body: some View {
        VStack { ZStack {
            Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .opacity(0.9)
            VStack {
                Spacer()
                Group {
                    HStack {
                        TextField("1", text: $cell01)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell02)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell03)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell04)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell05)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                    }
                    HStack {
                        TextField("", text: $cell06)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell07)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell08)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell09)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell10)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                    }
                    HStack {
                        TextField("", text: $cell11)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell12)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell13)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell14)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell15)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        
                    }
                    HStack {
                        TextField("3", text: $cell16)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell17)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell18)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("4", text: $cell19)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell20)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        
                    }
                    HStack {
                        TextField("X", text: $cell21)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("X", text: $cell22)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("5", text: $cell23)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell24)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("", text: $cell25)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.green)
                            .font(Font.system(size: 40, design: .default))
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                VStack {
                    HStack {
                        Spacer()
                        Text("Across").foregroundColor(.black) .fontWeight(.bold)
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Down").foregroundColor(.black) .fontWeight(.bold)
                        Spacer()
                        
                    }
                    HStack {
                        VStack {
                            Text("1) 요리하다").foregroundColor(across1Correct ? .red : .black)
                            Text("3) 사자").foregroundColor(across2Correct ? .red : .black)
                            Text("5) 지금").foregroundColor(across3Correct ? .red : .black)
                        }
                        .padding(.leading, 40)
                        Spacer()
                        VStack {
                            Text("1) 시원한").foregroundColor(down1Correct ? .red : .black)
                            Text("4) 아니요").foregroundColor(down2Correct ? .red : .black)
                        }.padding(.trailing, 50)
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {self.checkAnswers()}) {
                        Text("정답 확인하기")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .font(.custom("Arial Bold", size: 15))
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.black, lineWidth: 5)
                        )
                    }
                    Spacer()
                }
            }
        }}
    }
    
    func checkAnswers() {
        if (cell01.lowercased() == "c" && cell02.lowercased() == "o" && cell03.lowercased() == "o" && cell04.lowercased() == "k") {
            across1Correct = true
//            background(Color.white)
        }
        if (cell06.lowercased() == "o" && cell11.lowercased() == "o" && cell16.lowercased() == "l"){
            down1Correct = true
        }
        if (cell17.lowercased() == "i" && cell18.lowercased() == "o" && cell19.lowercased() == "n") {
            across2Correct = true
        }
        if (cell24.lowercased() == "o"){
            down2Correct = true
        }
        if (cell23.lowercased() == "n" && cell25.lowercased() == "w") {
            across3Correct = true
        }
    }
}

struct minigame2_Previews: PreviewProvider {
    static var previews: some View {
        minigame2()
    }
}
