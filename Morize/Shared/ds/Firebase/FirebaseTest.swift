//
//  FirebaseTest.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/02/14.
//

import SwiftUI
import FirebaseFirestore

struct FirebaseTest: View {
    let db = Firestore.firestore()
    var body: some View {
        Button {
            // document (사용자) 이름으로 단어장 배열이 저장됨
            db.collection("users").document("ds").setData([
                "words": [
                    "apple",
                    "banana",
                    "carrot",
                    "desert"
                ]
            ]) { err in
                if let err = err {
                    print(err)
                } else {
                    print("Success")
                }
            }
        } label: {
            Text("데이터 추가")
        }

    }
}

struct FirebaseTest_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseTest()
    }
}
