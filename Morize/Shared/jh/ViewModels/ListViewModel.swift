//
//  ListViewModel.swift
//  Morize
//
//  Created by Jinhee on 2022/01/24.
//

import SwiftUI
import Combine

class ListStore: ObservableObject{
    @Published var words = [List]()
    private let wordsKey = "WordListKey"
    
    func addNew(_ newWord:String, _ important:Bool){
        guard !newWord.isEmpty else { return }
        if important{
            self.words.insert(List(listItem: newWord, important: important), at: 0)
        }else{
            self.words.append(List(listItem: newWord, important: important))
        }
        saveWords()
    }
    
//    func modifyListDone(_ id:UUID){
//        for i in words.indices {
//            if (words[i].id==id){
//                let newDone:Bool = words[i].done ? false : true
//                let modifiedList = List(id: words[i].id, listItem: words[i].listItem, important: words[i].important, done: newDone)
//                words.replaceSubrange(i...i, with: repeatElement(modifiedList, count: 1))
//                break
//            }
//        }
//        saveWords()
//    }
    
//    func move(from source: IndexSet, to destination: Int){
//        self.words.move(fromOffsets: source, toOffset: destination)
//    }
    
//    func delete(at offests: IndexSet){
//        self.words.remove(atOffsets: offests)
//        saveWords()
//    }
    
    // MARK:- Store TodoList data using UserDefaults
    func saveWords() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.words), forKey: wordsKey)
    }
    
    func loadWords() {
        if let wordData = UserDefaults.standard.value(forKey: wordsKey) as? Data {
            if let wordList = try? PropertyListDecoder().decode(Array<List>.self, from: wordData) {
                self.words = wordList
            }
        }
    }
}
