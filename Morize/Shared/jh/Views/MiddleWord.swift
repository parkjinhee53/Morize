//
//  MiddleWord.swift
//  Morize
//
//  Created by Jinhee on 2022/01/06.
//

import SwiftUI

struct MiddleWord: View {
    @State var middlelist = middle().sortedArray()
    @ObservedObject var listStore = ListStore()
    @State var newWord: String = ""
    @State var isImportant: Bool = false
    struct ImportantWord: ViewModifier {
        var importantWordColor = Color.pink
        func body(content: Content) -> some View {
            return content
                .padding(.vertical, 5)
                .foregroundColor(importantWordColor)
        }
    }
    
    var body: some View {
            ScrollView {
                // 새로 추가하는 영단어 
                HStack {
                    Button(action: {
                    isImportant.toggle() },
                               label: {
                    Image(systemName: "exclamationmark.circle.fill") .foregroundColor(Color.red)
                })
                    TextField("추가하고 싶은 단어 입력", text: self.$newWord)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 5).fill(isImportant ? Color.orange : Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.2)))
                    Button(action: {
                        listStore.addNew(newWord, isImportant)
                        newWord = ""
                        isImportant = false
                    }, label: {
                        Image(systemName: "plus.circle.fill") .foregroundColor(Color.blue)
                    })
                }
                ForEach(self.listStore.words) { word in
                    HStack {
                        VStack {
                            Text(word.listItem)
                                .modifier(word.important ? ImportantWord() : ImportantWord(importantWordColor: Color.primary))
                        }
                        .padding(.leading, 20)
                        Spacer()
                        Button {
                            //listStore.delete(at: <#IndexSet#>)
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
                
                // 원래 있던 영단어 리스트
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
            .onAppear(perform: listStore.loadWords) // 추가한 단어 유지
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
