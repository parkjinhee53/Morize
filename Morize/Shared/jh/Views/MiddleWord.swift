//
//  MiddleWord.swift
//  Morize
//
//  Created by Jinhee on 2022/01/06.
//

import SwiftUI

struct MiddleWord: View {
    @State var middlelist = middle().sortedArray()

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<middlelist.count, id:\.self) { m in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(middlelist[m][0])
                            Text(middlelist[m][1])
                        }
                        .padding(.leading, 20)
                        Spacer()
                        Button {
                            removeMiddle(index: m)
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
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    // 삭제
    func removeMiddle(index: Int) {
        middlelist.remove(at: index)
    }
}

struct MiddleWord_Previews: PreviewProvider {
    static var previews: some View {
        MiddleWord()
    }
}
