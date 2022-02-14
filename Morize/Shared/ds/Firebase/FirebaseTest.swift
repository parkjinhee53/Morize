//
//  FirebaseTest.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/02/14.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct FirebaseTest: View {
    let db = Firestore.firestore()
    var body: some View {
        Button {
            var ref: DocumentReference? = nil
            ref = db.collection("users").addDocument(data: [
                "first": "Ada",
                "last": "Lovelace",
                "born": 1815
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
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
