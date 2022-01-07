//
//  HighWord.swift
//  Morize
//
//  Created by Jinhee on 2022/01/06.
//

import SwiftUI

struct HighWord: View {
    @State var highlist: [String] = ["administrative : 행정의, 관리의, 경영의","advocacy : 옹호, 변호","nonprofit : 비영리 단체","contribution : 의견 제시","auditorium : 강당","afford : 제공하다, ~할 여유가 있다","not to mention : ~은 물론이고[말할 것도 없고]","leftovers : 남은 음식","integrity : 진실성, 온전함","back down : 후퇴하다, 포기하다","uplifting : 행복감[희망]을 주는","absurd : 터무니없는","isolation : 고립","expertise : 전문 지식","take action : 조치를 취하다","concern : 관심사","sponsorship : 후원, 협찬","financially : 재정적으로","reputation : 평판","dwelling : 집, 주거","block party :가구(街區) 주민 파티","take place : 거행되다, 개최되다","specify : 명시하다","destroy : 말살하다, 죽이다","hatred : 증오, 혐오","primate : 영장류","regenerate : 재생하다","extinction : 멸종","inseparable :분리할 수 없는","hold onto : ~을 고수하다","phenomenon : 현상","at length : 상세히, 길게","definitive : 명확한, 한정적인","credibility : 진실성, 신뢰성","goodwill : 호의, 친선","retire : (기계 등을) 폐기하다","allow for : ~을 가능하게 하다","tribe : 부족, 종족","perpetual : 끊임없는","equivalent : 상응하는 것, 대응하는 것","analyze : 분석하다","consideration : 배려, 고려","play on : ~을 이용하다","prejudice : 편견","positively : 긍정적으로, 분명하게","trauma : 정신적 외상","emerge :등장하다, 생겨나다","replicate : 되풀이하다, 모사[복제]하다","remote : 멀리 떨어진, 외딴","track : 발자국","clinic : 강습, 치료소","evolutionary : 진화의","correspond : 부합하다, 일치하다","unconscious : 무의식의","instinct : 본능","needless to say : 말할 필요도 없이","fundamentally : 근본적으로","transmission : 전달","regulatory : 규제의","neutrality : 중립성","obligated : 의무가 있는","profitability : 수익성 ","miserable : 비참한","ethics : 윤리","parallel : 유사하다, 필적하다","allocate : 배분하다, 배치하다","innate : 타고난","dominant : 지배적인, 우세한","feature : 특징","rational : 합리적인, 이성적인","horrific : 끔찍한","idealize : 이상화하다","overlook : 못 보고 넘어가다, 간과하다","willfully : 의도적으로","despise : 경멸하다","spontaneous : 자발적인, 즉흥적인","torture : 심한 고통, 고문","consistency : 일관성","nutrient : 영양분, 영양소","hit upon : ~을 발견해 내다","non-refundable : 환불되지 않는","dwell on : ~에 대해 오래 생각하다","commercial : 상업의, 상업적인","dimension : 차원","anthropology : 인류학","coherent : 일관적인","informative : 유익한, 교육적인","lung cancer : 폐암","privileged : 특권을 가진","address : 대응하다, 다루다","roam : 돌아다니다","universality : 보편성, 일반성","remark : 말하다, 논평하다","make way for : ~에 자리를 내주다","deficit : 적자","authorized : 권한을 부여받은","comply with : 따르다, 준수하다","sustainable : 지속 가능한","figure out : ~을 알아내다","toss and turn : (잠을 못 자고) 뒤척이다"]
    
    var body: some View {
        List {
            ForEach(highlist, id : \.self) { h in
                Text(h)
            }
        }
    }
}

struct HighWord_Previews: PreviewProvider {
    static var previews: some View {
        HighWord()
    }
}
