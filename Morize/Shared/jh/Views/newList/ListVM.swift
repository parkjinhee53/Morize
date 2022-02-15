//
//  ListVM.swift
//  Morize
//
//  Created by judongseok on 2022/02/15.
//

import Foundation

class ListVM {
    var wordList: [[String]] = [
        ["apple", "사과", "명사"],
        ["banana", "바나나", "명사"]
    ]
    
    func wordListCount() -> Int {
        return wordList.count
    }
}
