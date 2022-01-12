//
//  UserInfo.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/12.
//

import Foundation

struct UserInfo: Codable {
    /*
     nickname: 이름
     */
    
    var username: String
    
    init(username: String = ""){
        self.username = username
    }
}
