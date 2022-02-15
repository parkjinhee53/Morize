//
//  ListView.swift
//  Morize
//
//  Created by judongseok on 2022/02/15.
//

import SwiftUI

struct Row: View {
    var word: String
    var mean: String
    var partsOfSpeech: String
    
    var body: some View {
        HStack {
            Text(word)
                .frame(width: 80, alignment: .leading)
            Text(partsOfSpeech)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .background(Color.init(hex: "#b7b1f5"))
                .cornerRadius(8)
            Text(mean)
                .padding(.leading, 30)
        }
    }
}

struct ListView: View {
    var vm = ListVM()
    var body: some View {
        NavigationView {
            SwiftUI.List {
                ForEach(vm.wordList, id: \.self) { i in
                    Row(word: i[0], mean: i[1], partsOfSpeech: i[2])
                }
            }
            .toolbar {
                NavigationLink(destination: {
                    ListAddView()
                }, label: {
                    Image(systemName: "plus")
                })
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
