//
//  MorizeApp.swift
//  Shared
//
//  Created by 김하은 on 2021/12/28.
//

import SwiftUI
import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import Firebase
import FirebaseFirestore

@main
struct MorizeApp: App {
    @StateObject var userAuth: GoogleDelegate = GoogleDelegate()
    @StateObject var kakaoAuth: AppDelegate = AppDelegate()
    
    @ObservedObject private var wordStorage = WordStorage.shared
    
    init() {
        FirebaseApp.configure() // 코드 추가
        UserDefaults.standard.set("로그인", forKey: "UserName")
        KakaoSDK.initSDK(appKey: "67ccb1551072d256d2a37ebef4b61bfd")
        getFirebaseDB()
    }
    
    func getFirebaseDB() {
        let db = Firestore.firestore()
        // db이름의 로그인한 사람 도큐먼트
        let docRef = db.collection("users").document("ds")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                let temp: [[String]] = (dataDescription?.values.map{ $0 as! [String] })!
                wordStorage.wordArr = temp
            } else {
                print("Document does not exist")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(self.userAuth)
                .environmentObject(self.kakaoAuth)
            //            FirebaseTest()
        }
    }
}
