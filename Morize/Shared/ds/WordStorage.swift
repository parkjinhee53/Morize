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
    
    @Published var wordArr: [String: [Any]] = [:]
    // card flip 변수
    @Published var word: [String] = []
    @Published var mean: [String] = []
    @Published var liked: [Bool] = []
    @Published var dragOffset: [CGSize] = []
    @Published var zIndexs: [Double] = []
    @Published var flipped: [Bool] = []
    
    
    func getRandomWords(count: Int) -> [String: [Any]] {
        var tempDic: [String: [Any]] = [:]
        for _ in 0...count {
            let tempEle = wordArr.randomElement()
            if tempDic[tempEle!.key] == nil {
                tempDic[tempEle!.key] = tempEle!.value
            }
        }
        return tempDic
    }
    
    // 주석추가
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
                let arr = snapshot.value as? [String: [Any]] ?? [:]
                self.wordArr = arr
                
                self.getUserWord()
                self.setting()
            });
        }
    }
    
    func setting() {
        for i in 0..<self.word.count {
            zIndexs.append(Double((i + 1) * -1))
            flipped.append(false)
            dragOffset.append(CGSize.zero)
        }
    }
    
    func getUserWord() {
        word = []
        mean = []
        for i in wordArr {
            if i.value[1] as! Bool {
                word.append(i.key)
                mean.append(i.value[0] as! String)
            }
        }
        print("dd")
    }
    
    func setBasedWords() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        let id = UserDefaults.standard.string(forKey: "UserID")!
        if id != "nil" {
            ref.child("users/\(id)").setValue(["apprehensive": ["걱정하는, 염려하는", false],
                                               "so-called" : ["소위, 이른바", false],
                                               "first-hand": ["직접", false],
                                               "utterly": ["완전히", false],
                                               "come into effect": ["실시되다", false],
                                               "accustomed": ["익숙한", false],
                                               "personnel": ["(집합적) 직원, 인원, 인사과", false],
                                               "lax": ["(행동 등이)느슨한", false],
                                               "press release": ["보도 자료 ", false],
                                               "drastically": ["심하게, 철저하게", false],
                                               "neutrality": ["중립성, 중립", false],
                                               "implication": ["영향, 밀접한 관계",false],
                                               "do one's utmost": ["전력을 다하다", false],
                                               "place A on standby": ["A를 대기 상태로 두다", false],
                                               "run short": ["~이 부족하다, 떨어지다", false],
                                               "affordability": ["감당할 수 있는 비용", false],
                                               "confidentiality": ["기밀, 비밀", false],
                                               "turn down": ["거절하다", false],
                                               "unanimous": ["만장일치의, 동의하는", false],
                                               "tentative": ["임시적인, 잠정적인", false],
                                               "inherently": ["본질적으로", false],
                                               "on account of": ["~때문에", false],
                                               "induce": ["유발하다", false],
                                               "tow": ["(차를) 견인하다", false],
                                               "determine the cause of": ["~의 원인을 알아내다", false],
                                               "consensus": ["여론, 일치된 의견", false],
                                               "amenity": ["편의 시설", false],
                                               "markedly": ["현저하게, 눈에 띄게", false],
                                               "minutes": ["회의록", false],
                                               "premier": ["으뜸의, 첫째의", false],
                                               "affix": ["(우표 등을) 붙이다", false],
                                               "quote": ["견적(액)", false],
                                               "be provided with": ["~이 갖추어져 있다", false]
            ])
        }
    }
    
    private init() { }
}
