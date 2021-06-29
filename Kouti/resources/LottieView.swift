//
//  LottieView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 28/06/21.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    public typealias UIViewType = UIView

    var animationView = AnimationView()

    var name: String
    var loopMode: LottieLoopMode = .playOnce
    let playAnimation: Bool
    
    @Binding var animationEnded: Bool
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animation = Animation.named(name)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        if playAnimation {
            context.coordinator.parent.animationView.play { state in
                if state {
                    animationEnded = true
                }
            }
        } else {
            context.coordinator.parent.animationView.pause()
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
}
