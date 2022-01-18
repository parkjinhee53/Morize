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
        VStack{
            if level == "none" {
                Button(action: {
                    UserDefaults.standard.set("middle", forKey: "level")
                }) {
                    Text("중등단어")
                }.padding()
                
                Button(action: {
                    UserDefaults.standard.set("high", forKey: "level")
                }) {
                    Text("고등")
                }.padding()
                
                Button(action: {
                    UserDefaults.standard.set("toeic", forKey: "level")
                }) {
                    Text("토익")
                }.padding()
            }
            else {
                TabViewSetting(level: $level)
            }
        }
    }
}

struct WordSelectView_Previews: PreviewProvider {
    static var previews: some View {
        WordSelectView()
    }
}
