//
//  WordSelectView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/14.
//

import SwiftUI

struct WordSelectView: View {
    @State var state = 0
    
    var body: some View {
        VStack{
            if state == 0 {
                Button(action: {
                    state = 1
                }) {
                    Text("중등단어")
                }.padding()
                
                Button(action: {
                    state = 2
                }) {
                    Text("고등")
                }.padding()
                
                Button(action: {
                    state = 3
                }) {
                    Text("토익")
                }.padding()
            }
            else if state == 1 {
                TabViewSetting()
            }
            else if state == 2 {
                TabViewSetting()
            }
            else if state == 3 {
                TabViewSetting()
            }
        }
    }
}

struct WordSelectView_Previews: PreviewProvider {
    static var previews: some View {
        WordSelectView()
    }
}
