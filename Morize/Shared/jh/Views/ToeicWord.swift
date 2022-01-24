//
//  ToeicWord.swift
//  Morize
//
//  Created by Jinhee on 2022/01/06.
//

import SwiftUI

struct ToeicWord: View {
    @State var toeiclist = toeic().sortedArray()
    
    var body: some View {
            ScrollView {
                ForEach(0..<toeiclist.count, id:\.self) { t in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(toeiclist[t][0])
                            Text(toeiclist[t][1])
                        }
                        .padding(.leading, 20)
                        Spacer()
                        Button {
                            removeToeic(index: t)
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
    func removeToeic(index: Int) {
        toeiclist.remove(at: index)
    }
}

struct ToeicWord_Previews: PreviewProvider {
    static var previews: some View {
        ToeicWord()
    }
}
