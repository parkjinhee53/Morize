//
//  MyTimer.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/29.
//

import Foundation
import SwiftUI
import Combine

class MyTimer: ObservableObject {
    var value: Int = 0
    //@Published var value: Int
    
    init() {
        // 간격, 반복 - true, timer를 in 해줌
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
}
