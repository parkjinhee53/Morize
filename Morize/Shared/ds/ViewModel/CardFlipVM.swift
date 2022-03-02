//
//  CardFlipVM.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/05.
//

import Foundation
import SwiftUI

class CardFlipVM: ObservableObject {
    @Published var dragOffset: [CGSize] = []
    @Published var zIndexs: [Double] = []
    @Published var flipped: [Bool] = []
    var colors = [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5582587719, blue: 0.7538533807, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]
    var currentIdx = 0
    var zindexsArr: [[Double]] = []
    var words: [String] = []
    var means: [String] = []
    
    init() {
        words = WordStorage.shared.word
        means = WordStorage.shared.mean
        zIndexs = WordStorage.shared.zIndexs
        flipped = WordStorage.shared.flipped
        dragOffset = WordStorage.shared.dragOffset
        
        setZindexArr()
    }
    
    func setZindexArr() {
        for _ in 0..<words.count {
            zindexsArr.append(zIndexs)
            let temp = zIndexs.popLast()!
            zIndexs.insert(temp, at: 0)
        }
    }
    
    func getWordsCount() -> Int {
        return WordStorage.shared.word.count
    }
    
    func getColor(index: Int) -> Color {
        return colors[index]
    }
}
