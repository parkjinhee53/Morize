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
    @ObservedObject var vm = ListVM()
    init() {
        vm.wordList = Array(WordStorage.shared.wordArr.keys)
        vm.meanList = Array(WordStorage.shared.wordArr.values)
    }
    var body: some View {
        NavigationView {
            SwiftUI.List {
                ForEach(vm.wordList.indices, id: \.self) { index in
                    Row(word: vm.wordList[index], mean: vm.meanList[index], partsOfSpeech: "명사")
                }
                .onDelete { (indexSet) in
                    self.vm.deleteToDB(index: indexSet)
                }
            }
            .toolbar {
                NavigationLink(destination: {
                    ListAddView(vm: vm)
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
