//
//  QuickSignInWithApple.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/13.
//

import SwiftUI
import AuthenticationServices

struct QuickSignInWithApple: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func setupProviderLoginView() {
//        let button = ASAuthorizationAppleIDButton()
//        button.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
//        self.loginProviderStackView.addArrangedSubview(button)
    }
    
    func appleLogin() {
        
    }
}
