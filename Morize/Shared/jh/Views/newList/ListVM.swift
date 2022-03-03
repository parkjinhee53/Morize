//
//  ListVM.swift
//  Morize
//
//  Created by judongseok on 2022/02/15.
//

import Foundation
import Firebase
import FirebaseFirestore

class ListVM: ObservableObject {
    var ref: DatabaseReference!
    
    @Published var wordList: [String] = []
    @Published var meanList: [String] = []
    @Published var likes: [Bool] = []
    func wordListCount() -> Int {
        return wordList.count
    }
    
    func saveToDB(word: String, mean: String, like: Bool = false) {
        let id = UserDefaults.standard.string(forKey: "UserID")!
        if id != "nil" {
            ref = Database.database().reference()
            wordList.append(word)
            meanList.append(mean)
            likes.append(like)
            ref.child("users/\(id)/\(word)").setValue(["\(mean)", like])
            
            WordStorage.shared.getFirebaseDB()
        }
    }
    
    func saveLike(word: String, mean: String, like: Bool) {
        let id = UserDefaults.standard.string(forKey: "UserID")!
        if id != "nil" {
            ref = Database.database().reference()
            ref.child("users/\(id)/\(word)").setValue(["\(mean)", like])
        }
    }
    
    func deleteToDB(index: IndexSet) {
        let id = UserDefaults.standard.string(forKey: "UserID")!
        if id != "nil" {
            ref = Database.database().reference()
            ref.child("users/\(id)/\(wordList[index.first!])").removeValue()
            wordList.remove(atOffsets: index)
            meanList.remove(atOffsets: index)
            likes.remove(atOffsets: index)
        }
    }
}
