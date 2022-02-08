//
//  ListModel.swift
//  Morize
//
//  Created by Jinhee on 2022/01/24.
//

import SwiftUI

struct List: Identifiable, Codable{
    var id = UUID()
    let listItem: String
    let important: Bool
    //var done: Bool = false
}
