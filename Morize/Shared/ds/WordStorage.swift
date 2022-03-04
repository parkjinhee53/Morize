//
//  WordStorage.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/02/16.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class WordStorage: ObservableObject {
    static let shared = WordStorage()
    
    @Published var wordArr: [String: String] = [:]

    func getRandomWords(count: Int) -> [String: String] {
        var tempDic: [String: String] = [:]
        for _ in 0...count {
            let tempEle = wordArr.randomElement()
            if tempDic[tempEle!.key] == nil {
                tempDic[tempEle!.key] = tempEle!.value
            }
        }
        return tempDic
    }
    
    func getFirebaseDB() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        let id = UserDefaults.standard.string(forKey: "UserID")!
        if id != "nil" {
            ref.child("users/\(id)").getData(completion:  { error, snapshot in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                let arr = snapshot.value as? [String: String] ?? [:]
                self.wordArr = arr
            });
        }
    }
    
    private init() { }
}
