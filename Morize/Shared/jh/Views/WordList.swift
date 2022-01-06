//
//  WordList.swift
//  Morize
//
//  Created by Jinhee on 2022/01/04.
//

import SwiftUI

struct Middle: View {
    var body: some View {
        Text("apple")
    }
}
struct High: View {
    var body: some View {
        Text("house")
    }
}
struct TOEIC: View {
    var body: some View {
        Text("ice")
    }
}

struct WordList: View {
    var body: some View {
        List {
            Section(header: Text("중등 영단어"), footer: Text("footer"), content: {
                Middle()
            })
            Section(header: Text("고등 영단어"), footer: Text("footer"), content: {
                High()
            })
            Section(header: Text("토익 영단어"), footer: Text("footer"), content: {
                TOEIC()
            })
        }
        .listStyle(SidebarListStyle())
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
    }
}
