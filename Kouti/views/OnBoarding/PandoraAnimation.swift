//
//  PandoraAnimation.swift
//  Kouti
//
//  Created by Thiago Medeiros on 28/06/21.
//

import SwiftUI

struct PandoraAnimation: View {
    @Binding var animationEnded: Bool
    @Binding var playAnimation: Bool
//    @State var animationEnded: Bool = false
//    @State var playAnimation: Bool = false
    
    var body: some View {
        LottieView(name: "PandoraAnimation", loopMode: .playOnce, playAnimation: playAnimation, animationEnded: $animationEnded)
            .edgesIgnoringSafeArea(.all)
    }
}

struct PandoraAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PandoraAnimation(animationEnded: .constant(false), playAnimation: .constant(true))
//        PandoraAnimation()
    }
}
