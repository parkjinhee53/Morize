//
//  WordStorage.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/02/16.
//

import SwiftUI

class WordStorage: ObservableObject {
    static let shared = WordStorage()

    @Published var wordArr: [[String]] = []

    private init() { }
}
