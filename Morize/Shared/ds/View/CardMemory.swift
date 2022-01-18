//
//  CardMemory.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/01/10.
//

import SwiftUI

struct CardMemory: View {
    @State var isFirst = true
    var body: some View {
        if isFirst {
            CardFlipTutorial(isFirst: $isFirst)
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
