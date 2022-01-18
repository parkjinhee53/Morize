//
//  Middle.swift
//  Morize
//
//  Created by Jinhee on 2022/01/10.
//

import Foundation

struct middle {

    var middlelist = ["culture": "문화, 교양",
                      "experience": "경험",
                      "education": "교육(하다)",
                      "symbol": "상징",
                      "effect": "결과, 영향 , 효과",
                      "liberty": "자유",
                      "affair": "사건, 일",
                      "comfort": "안락, 위안",
                      "tradition": "전통, 전설",
                      "subject": "학과, 주제, 백성",
                      "object": "물건, 목적",
                      "source": "출처, 근원",
                      "revolution": "혁명",
                      "pollution": "오염",
                      "system": "조직, 체계, 제도",
                      "triumph": "승리",
                      "respect": "존경(하다)",
                      "communication": "전달, 교통",
                      "foundation": "기초, 근거, 설립",
                      "glory": "영광",
                      "situation": "위치, 상황",
                      "competition": "경쟁",
                      "prairie": "대초원",
                      "effort": "노력",
                      "section": "부분, 구역",
                      "rein": "고삐",
                      "solution": "해결, 용해",
                      "honor": "명예, 경의",
                      "unity": "통일, 일치",
                      "population": "인구",
                      "direction": "방향, 지시",
                      "dialogue": "대화",
                      "republic": "공화국",
                      "method": "방법",
                      "increase": " 증가(하다)",
                      "decrease": "감소(하다)",
                      "amount": "총액, 양",
                      "ancestor": "조상, 선조",
                      "voyage": "항해, 여행",
                      "sculpture": "조각",
                      "instrument": "기구, 악기",
                      "figure": "모습, 인물, 숫자",
                      "activity": "활동",
                      "cause": "원인, 이유",
                      "worth": "가치",
                      "accident": "사고",
                      "adventure": "모험",
                      "view": "경치, 의견",
                      "relative": "친척; 상대적인",
                      "superstition": "미신",
                      "habit": "습관, 버릇",
                      "wealth": "재산, 부",
                      "treasure": "보물",
                      "universe": "우주, 전 세계",
                      "adult": "어른",
                      "feast": "축제, 향연",
                      "resource": "자원, 수단",
                      "ruin": "파멸, 폐허",
                      "monument": "기념비, 기념물",
                      "information": "정보, 지식, 통지",
                      "appetite": "식욕",
                      "unification": "통일",
                      "mystery": "신비",
                      "thermometer": "온도계",
                      "burden": "짐",
                      "series": "연속, 시리즈",
                      "oath": "맹세, 선서",
                      "appointment": "임명, 약속",
                      "clue": "실마리, 단서",
                      "debt": "빚, 은혜",
                      "hydrogen": "수소",
                      "control": "통제, 지배",
                      "uniform": "제복",
                      "design": "계획, 설계",
                      "damage": "손해, 손상",
                      "custom": "관습, 습관",
                      "traffic": "교통",
                      "sophomore": "2학년생",
                      "temperature": "온도, 체온",
                      "limit": "제한, 한계",
                      "statue": "조각상",
                      "furniture": "가구",
                      "parade": "행렬",
                      "public": "공중; 공공의",
                      "pilgrim": "순례자, 청교도",
                      "greeting": "인사, 축하",
                      "language": "언어",
                      "opinion": "의견",
                      "athlete": "운동선수",
                      "supply": "공급(하다)",
                      "surface": "표면(의)",
                      "electricity": "전기",
                      "order": "질서, 명령, 주문",
                      "spirit": "정신",
                      "purpose":"목적",
                      "promise": "약속, 가망",
                      "project": "계획(하다)",
                      "government": "정부, 정치",
                      "exercise": "운동(하다), 연습",
                      "comparison": "비교"
    ]
    
    func sortedArray() -> [[String]]{
        var array: [[String]] = []
        for i in middlelist {
            array.append([i.key, i.value])
        }
        array.sort { i, j in
            i[0] < j[0]
        }
        return array
    }
}
