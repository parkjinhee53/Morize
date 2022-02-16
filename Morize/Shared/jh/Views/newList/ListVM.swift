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
    private let db = Firestore.firestore()
    
    @Published var wordList: [[String]] = []
    
    func wordListCount() -> Int {
        return wordList.count
    }
    
    func saveToDB(word: String, mean: String) {
        let arr = [word, mean, "명사"]
//        wordList.append(arr)
        
        db.collection("users").document("ds").setData([
            String(wordList.count): arr
        ], merge: true) { err in
            if let err = err {
                print(err)
            } else {
                print("Success")
            }
        }
    }
}
