//
//  StreakDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct StreakDisplay: View {
    @State var streakCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Streak \(streakCount)")
                .font(.system(size: 13, weight: .bold, design: .default))
            flameDisplay()
        }
    }
    
    @ViewBuilder
    func flameDisplay() -> some View {
        let litFlames = min(7, streakCount)
        
        // TODO: A imagem está pixelada, estudar @2x, @3x para ver se resolve
        HStack {
            Image(litFlames >= 1 ? "litFlame" : "unlitFlame")
            Image(litFlames >= 2 ? "litFlame" : "unlitFlame")
            Image(litFlames >= 3 ? "litFlame" : "unlitFlame")
            Image(litFlames >= 4 ? "litFlame" : "unlitFlame")
            Image(litFlames >= 5 ? "litFlame" : "unlitFlame")
            Image(litFlames >= 6 ? "litFlame" : "unlitFlame")
            Image(litFlames >= 7 ? "litFlame" : "unlitFlame")
        }
        
    }
}

struct StreakDisplay_Previews: PreviewProvider {
    static var previews: some View {
        StreakDisplay(streakCount: 4)
    }
}
