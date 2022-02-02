//
//  ComposeMailData.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/02.
//

import Foundation

struct ComposeMailData {
    /*
     subject: 제목
     recipients: 받을 이메일 주소
     */
    let subject: String
    let recipients: [String]?
}
