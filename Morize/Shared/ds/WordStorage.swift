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
    // card flip 변수
    @Published var word: [String] = []
    @Published var mean: [String] = []
    @Published var dragOffset: [CGSize] = []
    @Published var zIndexs: [Double] = []
    @Published var flipped: [Bool] = []
    
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
        let keys = Array(wordArr.keys).sorted()
        let values = keys.map { wordArr[$0]! }
        word = keys
        mean = values
        print(keys)
        print(values)
    }
    
    func setBasedWords() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        let id = UserDefaults.standard.string(forKey: "UserID")!
        if id != "nil" {
            ref.child("users/\(id)").setValue(["apprehensive": "걱정하는, 염려하는",
                                               "so-called" : "소위, 이른바",
                                               "first-hand": "직접",
                                               "utterly": "완전히",
                                               "come into effect": "실시되다",
                                               "accustomed": "익숙한",
                                               "personnel": "(집합적) 직원, 인원, 인사과",
                                               "lax": "(행동 등이)느슨한",
                                               "press release": "보도 자료 ",
                                               "drastically": "심하게, 철저하게",
                                               "neutrality": "중립성, 중립",
                                               "implication": "영향, 밀접한 관계",
                                               "do one's utmost": "전력을 다하다",
                                               "place A on standby": "A를 대기 상태로 두다",
                                               "run short": "~이 부족하다, 떨어지다",
                                               "affordability": "감당할 수 있는 비용",
                                               "confidentiality": "기밀, 비밀",
                                               "turn down": "거절하다",
                                               "unanimous": "만장일치의, 동의하는",
                                               "tentative": "임시적인, 잠정적인",
                                               "inherently": "본질적으로",
                                               "on account of": "~때문에",
                                               "induce": "유발하다",
                                               "tow": "(차를) 견인하다",
                                               "determine the cause of": "~의 원인을 알아내다",
                                               "consensus": "여론, 일치된 의견",
                                               "amenity": "편의 시설",
                                               "markedly": "현저하게, 눈에 띄게",
                                               "minutes": "회의록",
                                               "premier": "으뜸의, 첫째의",
                                               "affix": "(우표 등을) 붙이다",
                                               "quote": "견적(액)",
                                               "be provided with": "~이 갖추어져 있다",
                                               "bulk": "대량의",
                                               "deal with": "(문제 등을) 처리하다",
                                               "accomplished": "숙련된, 노련한",
                                               "remain": "아직 ~해야 한다, ~한 상태이다",
                                               "in particular": "특히",
                                               "run effectively": "효과적으로 작동하다",
                                               "consecutive": "연속적인",
                                               "donor": "기증자, 증여자",
                                               "informative": "유익한, 정보를 주는",
                                               "marginal": "약간의, 주변의",
                                               "attribute": "(원인을) ~의 덕분으로 돌리다",
                                               "complimentary": "무료의",
                                               "renowned": "저명한, 유명한",
                                               "inhibition": "(감정의) 거리낌, 억압",
                                               "commence": "시작되다",
                                               "platform": "승강장",
                                               "tariff": "관세",
                                               "transmit": "전염시키다",
                                               "susceptible to": "~에 걸리기 쉬운",
                                               "be ideal for": "~에 이상적이다",
                                               "drape": "(방 등을 커튼 등으로) 장식하다",
                                               "informed": "정보에 근거한",
                                               "on the payroll": "고용되어",
                                               "convention": "관례, 관습",
                                               "manage to do": "가까스로 ~하다",
                                               "assist with": "~을 돕다",
                                               "procrastinate": "미루다, 꾸물거리다",
                                               "accomplish": "성취하다",
                                               "exclusively": "독점적으로",
                                               "aggressively": "적극적으로",
                                               "wane": "감소, 쇠퇴",
                                               "stipulation": "계약 조건",
                                               "omit": "빠뜨리다, 생략하다",
                                               "renew": "갱신하다",
                                               "settle": "해결하다, 처리하다",
                                               "encompass": "포함하다, 둘러싸다",
                                               "account for": "~의 이유를 밝히다, 차지하다",
                                               "physician": "내과 의사",
                                               "have every intention of -ing": "꼭 -하고자 하다",
                                               "publicize": "공표하다, 광고하다",
                                               "economize": "절약하다, 아끼다",
                                               "pick up": "~을 찾다, 도중에 태우다",
                                               "hospitality industry": "서비스업",
                                               "financial health": "재정적 안정",
                                               "inhabitant": "주민, 거주자",
                                               "prescribe": "(약을) 처방하다",
                                               "transmission": "전송, 전달",
                                               "innate": "타고난",
                                               "defer": "연기하다, 미루다",
                                               "considerable": "상당한",
                                               "enclose": "~을 둘러싸다, 에워싸다",
                                               "a wide selection of": "다양하게 선정된",
                                               "reliant": "의존하는, 의지하는",
                                               "itinerary": "여행 일정",
                                               "extend": "연장하다, (감사의 뜻)말하다",
                                               "research on": "~에 대한 연구 ",
                                               "lesser": "~보다 중요치 않은",
                                               "by means of": "~에 의하여, ~으로",
                                               "outline": "개요, 설명하다",
                                               "responsive": "반응이 빠른, 바로 대답하는",
                                               "confidential": "기밀의, 내밀한",
                                               "be accountable to A": "A에게 설명할 의무가 있다",
                                               "seasoned traveler": "숙련된 여행가",
                                               "likable": "호감이 가는",
                                               "address an issue": "쟁점을 거론하다",
                                               "note": "주목하다, 특별히 언급하다",
                                               "solely": "오로지, 단독으로"
                              ])
        }
    }
    
    private init() { }
}
