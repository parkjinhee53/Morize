//
//  WordSelectView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/14.
//

import SwiftUI

struct WordSelectView: View {
    var body: some View {
        
        VStack{
            Button(action: {
                
            }) {
                Text("중등")
            }.padding()
            
            Button(action: {
                
            }) {
                Text("고등")
            }.padding()
            
            Button(action: {
                
            }) {
                Text("토익")
            }.padding()
        }
    }
}

struct WordSelectView_Previews: PreviewProvider {
    static var previews: some View {
        WordSelectView()
    }
}
