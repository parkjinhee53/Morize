//
//  HighWord.swift
//  Morize
//
//  Created by Jinhee on 2022/01/06.
//

import SwiftUI

struct HighWord: View {

    @State var highlist = high().sortedArray()
    
    var body: some View {
            ScrollView {
                ForEach(0..<highlist.count, id:\.self) { h in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(highlist[h][0])
                            Text(highlist[h][1])
                        }
                        .padding(.leading, 20)
                        Spacer()
                        Button {
                            removeHigh(index: h)
                        } label: {
                            Image(systemName: "x.circle")
                                .frame(width: 10, height: 10, alignment: .center)
                        }
                        .padding(.trailing, 20)
                    }
                    .frame(width: 300, height: 150, alignment: .center)
                    .background(Color.init(hex: "aaaaaa"))
                    .cornerRadius(16)
                    .padding()
                }
            }
    }
    
    // 삭제 
    func removeHigh(index: Int) {
        highlist.remove(at: index)
    }
}

struct HighWord_Previews: PreviewProvider {
    static var previews: some View {
        HighWord()
    }
}
