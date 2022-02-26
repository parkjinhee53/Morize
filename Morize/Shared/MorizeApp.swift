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
        getFirebaseDB()
        UserDefaults.standard.set("로그인", forKey: "UserName")
        KakaoSDK.initSDK(appKey: "67ccb1551072d256d2a37ebef4b61bfd")
    }
    
    func getFirebaseDB() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        //        ref.child("users").child("ds").setValue(["apple": "사과"])
        //        ref.child("users/ds/banana").setValue("바나나")
        
        ref.child("users/ds").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            let arr = snapshot.value as? [String: String] ?? [:]
            wordStorage.wordArr = arr
        });
    }
    
    var body: some Scene {
        WindowGroup {
//            LoginView()
//                .environmentObject(self.userAuth)
//                .environmentObject(self.kakaoAuth)
            MiniGame2B(currentPage: .constant(Pages.GamePage),savePhotos:.constant(false))
            
        }
    }
}
