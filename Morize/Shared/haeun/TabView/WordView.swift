//
//  WordView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct WordView: View {
    var body: some View {
        Text("Word Card")
        Text(UserDefaults.standard.string(forKey: "UserName") ?? "ㅁㄴㅇㄹ")
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
