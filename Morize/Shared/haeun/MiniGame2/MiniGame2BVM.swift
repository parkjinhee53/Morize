//
//  MiniGame2BVM.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/17.
//

import Foundation
import SwiftUI
import Combine

class MiniGame2BVM: ObservableObject{
    // MARK: - 생성자
    // 생성자
    init() {
        // 생성 시 단어 섞기
        alphabet.shuffle()
    }
    
    // MARK: - 변수
    // 4-5단어, 6-7단어 게임 레벨 변수
    var level = 4
    
    // 알파벳 배열
    var alphabet: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    // 정답 배열
    var word: [String] = ["apple", "ebon", "coin", "code", "edit", "tell", "like", "bear", "bill", "bark"]
    
    // 클릭 시 알파벳을 저장할 배열
    @Published var arr: [String] = []
    
    // 클릭해야 할 알파벳 4개
    @Published var alphaboard: [Int] = [0, 0, 0, 0]
    
    // 정답 딕셔너리
    var answerB: [String: [String]] = ["apple": ["a","p","p","l","e"],
                                      "ebon": ["e","b","o","n"],
                                      "coin": ["c","o","i","n"],
                                      "code": ["c","o","d","e"],
                                      "edit": ["e","d","i","t"],
                                      "tell": ["t","e","l","l"],
                                      "like": ["l","i","k","e"],
                                      "bear": ["b","e","a","r"],
                                      "bill": ["b","i","l","l"],
                                      "bark": ["b","a","r","k"]]
    
    // 정답 딕셔너리
//    var answer: [String: String] = ["사과": "apple",
//                                    "흑단으로 만든": "ebon",
//                                    "동전": "coin",
//                                    "암호": "code",
//                                    "수정하다": "edit",
//                                    "말하다": "tell",
//                                    "좋아하다": "like",
//                                    "곰": "bear",
//                                    "계산서": "bill",
//                                    "짖다": "bark"]
    
    // 체크 배열
    var checkArray: [Int] = []
    
//    private(set) var vocabubble = [Voca : Int]()
    
    // MARK: - 메소드
    // 선택된 단어가 맞는지 체크
    // 선택하는 단어가 4개이상이면 반복문으로 돌려야되는지?
    
    func check(a: String, b: String) -> Bool{
        if answerB[a] == [b] {
            print("맞았어요!")
            return true
        }
        else{
            print("틀렸어요!")
            return false
        }
    }
    
    // 체크 배열에 값 추가
    func add(pos: Int){
        checkArray.append(pos)
    }
    
    // 게임이 끝났는지 검사
    func checkEnd() -> Bool {
        // 게임보드에 2와 0이 있으면 게임 완료
        
        if alphaboard.contains(1) {
            return false
        }
        
        return true
    }
    
    // 게임 리셋
    func resetGame() {
        
    }
    
    // 정답 개수 count
    
//    // 맞은 개수
//    var correctAnswer: String {
//        "⭕️ \(self.answerCount.correct)"
//    }
//    
//    // 틀린 개수
//    var incorrectAnswer: String {
//        "❌ \(self.answerCount.incorrect)"
//    }
    
//    var answerCount: (correct: Int, incorrect: Int) {
//        var count: (correct: Int, incorrect: Int) = (0, 0)
//        for (question, selected) in vocabubble {
//            if selectedIndex == question.correctAnswerOrder {
//                count.correct += 1
//            } else {
//                count.incorrect += 1
//            }
//        }
//        return count
//    }
}



// 문제
//struct Voca: Hashable {
//    let vocaQuestion: String // 문제
//    let vocaPossible: [String] // Bubble
//    let correctAnswerOrder: [String] // 클릭 순서
//
//    var arr = ["P", "P", "L", "E"]
//    var anarr: [String]
//
//    for i in arr {
//        anarr += vocaPossible.index()
//    }
//
//    static let allQuestions: [Voca] = [
//        Voca(vocaQuestion: "A _ _ _ _ \n 사과",
//             vocaPossible: [
//                    "L",
//                    "P",
//                    "P",
//                    "E",
//                 ],
//             // 클릭해서 배열에 저장하는 코드 필요
//             correctAnswerOrder: anarr),
//        Voca(vocaQuestion: "수박",
//             vocaPossible: [
//                    "Apple",
//                    "Pear",
//                    "Watermelon",
//                    "Peach",
//                 ],
//             correctAnswerOrder: [""]),
//        Voca(vocaQuestion: "빵",
//             vocaPossible: [
//                    "Bread",
//                    "Scone.",
//                    "Bead",
//                    "Cookie",
//                 ],
//             correctAnswerOrder: [""]),
//        Voca(vocaQuestion: "Coffee",
//             vocaPossible: [
//                    "쥬스",
//                    "스무디",
//                    "차",
//                    "커피",
//                 ],
//             correctAnswerOrder: [""]),
//    ]
//}
