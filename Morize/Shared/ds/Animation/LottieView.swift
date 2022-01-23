//
//  LottieView.swift
//  Morize (iOS)
//
//  Created by judongseok on 2021/12/30.
//

import SwiftUI
import Lottie
import UIKit

struct LottieView: UIViewRepresentable {
    var filename: String
    let isPaused: Bool
    let animationView = AnimationView()
    let view = UIView(frame: .zero)
    
    func makeUIView(context: Context) -> UIView {
        animationView.animation = Animation.named(filename)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        if isPaused {
            context.coordinator.parent.animationView.currentFrame = 0
        } else {
            context.coordinator.parent.animationView.play()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: LottieView

        init(_ parent: LottieView) {
            self.parent = parent
        }
    }
    
    typealias UIViewType = UIView
}
