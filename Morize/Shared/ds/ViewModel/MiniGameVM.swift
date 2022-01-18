//
//  MiniGameVM.swift
//  Morize (iOS)
//
//  Created by judongseok on 2021/12/29.
//

import Foundation
import SwiftUI

class MiniGameVM: ObservableObject{
    // MARK: - 생성자
    // 생성자
    init() {
        // 생성 시 단어 섞기
        wordFour.shuffle()
    }
    
    // MARK: - 변수
    // 4*4, 6*6 게임 레벨 변수
    var level = 4

    // 문제 배열
    var wordFour: [String] = ["사과", "apple", "바나나", "banana", "당근", "carrot", "다이아몬드", "diamond", "코끼리", "elephant", "넷", "four", "훌륭한", "great", "숨다", "hide"]
    
    // 정답 딕셔너리
    var answer: [String: String] = ["사과": "apple",
                                      "바나나": "banana",
                                      "당근": "carrot",
                                      "다이아몬드": "diamond",
                                      "코끼리": "elephant",
                                      "넷": "four",
                                      "훌륭한": "great",
                                      "숨다": "hide"]
    
    // 체크 배열
    var checkArray: [Int] = []
    
    // 버튼 disable 배열, 0: 기본상태 1: 대기상태, 2: 사라진상태
    @Published var buttonArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    // MARK: - 메소드
    // 선택된 2개의 단어가 맞는지 체크
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
        if buttonArray.contains(1) || buttonArray.contains(0) {
            return false
        }
        return true
    }
}
