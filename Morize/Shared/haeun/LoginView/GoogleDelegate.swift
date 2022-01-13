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
    @Published var isLoggedIn: Bool = false
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
            UserDefaults.standard.set(givenName, forKey: "UserName")
            print(UserDefaults.standard.string(forKey: "UserName")!)
//            self.member.username = givenName ?? ""
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
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
                self.checkStatus()
            }
        )
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
