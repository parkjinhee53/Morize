//
//  GoogleDelegate.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/12.
//

import SwiftUI
import GoogleSignIn

class GoogleDelegate: ObservableObject {
    @State var member = UserInfo.init()    // 로그인 관련 init 파일
    
    @Published var givenName: String = ""    // google nickname
    @Published var errorMessage: String = ""
    
    init() {
        check()
    }

    // google userInfo
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else {return}
            let givenName = user.profile?.givenName
            // UserID 저장
            UserDefaults.standard.set(user.userID, forKey: "UserID")
            // UserName 저장
            UserDefaults.standard.set(givenName, forKey: "UserName")
            UserDefaults.standard.set(true, forKey: "isLogin")
            
            WordStorage.shared.getFirebaseDB()
        }else{
            self.member.username = "로그인 안됨"
        }
    }
    
    func firstLoggin(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else {return}
            let givenName = user.profile?.givenName
            // UserID 저장
            UserDefaults.standard.set(user.userID, forKey: "UserID")
            // UserName 저장
            UserDefaults.standard.set(givenName, forKey: "UserName")
            UserDefaults.standard.set(true, forKey: "isLogin")
            
            WordStorage.shared.setBasedWords()
            WordStorage.shared.getFirebaseDB()
        }else{
            self.member.username = "로그인 안됨"
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn{ user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    // 로그인 
    func signIn(){
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let signInConfig = GIDConfiguration.init(clientID: "236543077821-h2fmabvqa7gbk6p0oka8vt4og0lj2qn4.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.firstLoggin()
            }
        )
    }
    
    // 로그아웃
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
