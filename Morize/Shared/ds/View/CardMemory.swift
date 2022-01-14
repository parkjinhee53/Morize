//
//  CardMemory.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/10.
//

import SwiftUI

struct CardMemory: View {
    @AppStorage("isFirstTutorial") var isFirst : Bool = UserDefaults.standard.bool(forKey: "isFirstTutorial")
    var test: Bool = true
    var body: some View {
        if isFirst {
            CardFlipTutorial()
        }
        else {
            CardFlip()
        }
    }
}

struct CardMemory_Previews: PreviewProvider {
    static var previews: some View {
        CardMemory()
    }
}
