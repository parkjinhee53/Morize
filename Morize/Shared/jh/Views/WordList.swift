//
//  WordList.swift
//  Morize
//
//  Created by Jinhee on 2022/01/04.
//

import SwiftUI

struct WordList: View {
    var body: some View {
        VStack {
            HStack {
                Text("list")
                    .padding()
                    .font(.title)
                Spacer()
            }
            Spacer()
        }
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
    }
}
