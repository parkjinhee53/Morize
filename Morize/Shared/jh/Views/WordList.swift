//
//  WordList.swift
//  Morize
//
//  Created by Jinhee on 2022/01/04.
//

import SwiftUI

struct WordList: View {
//    @State var arr1: [String] = ["하나", "둘"]
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: MiddleWord(),
                    label: {
                        Text("중등 영단어")
                    }
                )
                NavigationLink(
                    destination: HighWord(),
                    label: {
                        Text("고등 영단어")
                    }
                )
                NavigationLink(
                    destination: ToeicWord(),
                    label: {
                        Text("토익")
                    }
                )
            }
        }.navigationBarItems(trailing: EditButton())
        .navigationTitle(Text("영단어"))
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
    }
}
