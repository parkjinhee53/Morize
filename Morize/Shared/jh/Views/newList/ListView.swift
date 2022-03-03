//
//  ListView.swift
//  Morize
//
//  Created by judongseok on 2022/02/15.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Row: View {
    var word: String
    var mean: String
    var partsOfSpeech: String
    
    @Binding var vmLike: Bool
    @Binding var liked: Bool
    var body: some View {
        HStack {
            VStack {
                Text(word)
                    .frame(width: 150, alignment: .leading)
                    .font(.custom("NotoSansKR-Regular", size: 16))
                
                Text(mean)
                    .frame(width: 150, alignment: .leading)
                    .font(.custom("NotoSansKR-Regular", size: 16))
            }
            Spacer()
            Button {
                liked.toggle()
                vmLike = liked
                
                var ref: DatabaseReference!
                let id = UserDefaults.standard.string(forKey: "UserID")!
                if id != "nil" {
                    ref = Database.database().reference()
                    ref.child("users/\(id)/\(word)").setValue(["\(mean)", vmLike])
                }
            } label: {
                Image(systemName: self.liked == false ? "star" : "star.fill")
                    .foregroundColor(Color.init(hex: "008E00"))
            }
        }
    }
}

struct ListView: View {
    @ObservedObject var vm = ListVM()
    init() {
        vm.wordList = Array(WordStorage.shared.wordArr.keys).sorted()
        vm.meanList = vm.wordList.map { (WordStorage.shared.wordArr[$0]![0] as? String)! }
        vm.likes = vm.wordList.map { (WordStorage.shared.wordArr[$0]![1] as? Bool)! }
        UITableView.appearance().backgroundColor = .white // Uses UIColor
    }
    var body: some View {
        NavigationView {
            SwiftUI.List {
                ForEach(vm.wordList.indices, id: \.self) { index in
                    Row(word: vm.wordList[index], mean: vm.meanList[index], partsOfSpeech: "명사", vmLike: $vm.likes[index], liked: $vm.likes[index])
                }
                .onDelete { (indexSet) in
                    self.vm.deleteToDB(index: indexSet)
                }
            }
            .padding(.top, -50)
            .background(.white)
            .toolbar {
                NavigationLink(destination: {
                    ListAddView(vm: vm)
                }, label: {
//                    Image(systemName: "plus")
                    Text("추가")
                })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
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
