//
//  MiniGame2BVM.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/17.
//

import Foundation
import SwiftUI

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
    
    // 정답 비교 배열
    var word: [String] = ["apple", "ebon", "coin", "code", "edit", "tell", "like", "bear", "bill", "bark"]
    
    // 클릭해야 할 알파벳 배열 4개
    @Published var alphaboard: [Int] = [0, 0, 0, 0]
    
    // 정답 딕셔너리
    var answer: [String: String] = ["사과": "apple",
                                    "흑단으로 만든": "ebon",
                                    "동전": "coin",
                                    "암호": "code",
                                    "수정하다": "edit",
                                    "말하다": "tell",
                                    "좋아하다": "like",
                                    "곰": "bear",
                                    "계산서": "bill",
                                    "짖다": "bark"]
    
    // 체크 배열
    var checkArray: [Int] = []
    
    
    // MARK: - 메소드
    // 선택된 단어가 맞는지 체크
    // 선택하는 단어가 4개이상이면 반복문으로 돌려야되는지?
    
    func check(a: String, b: String) -> Bool{
        if answer[a] == b || answer[b] == a{
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
}
