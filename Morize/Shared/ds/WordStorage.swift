//
//  WordStorage.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/02/16.
//

import SwiftUI

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
    
    private init() { }
}
