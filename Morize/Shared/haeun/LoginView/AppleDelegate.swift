//
//  AppleDelegate.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/13.
//

import SwiftUI
import AuthenticationServices

struct AppleDelegate: UIViewRepresentable {
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func showAppleLogin(){
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
    }
}

