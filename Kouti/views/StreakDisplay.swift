//
//  StreakDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

// TODO: A animação pode melhorar, acender e apagar a chama devagar
struct StreakDisplay: View {
    @Binding var streakCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Streak \(streakCount)")
                .font(.system(size: 13, weight: .bold, design: .default))
            flameDisplay()
        }
    }
    
    @ViewBuilder
    func flameDisplay() -> some View {
        // TODO: Consertar a forma com que o streak é contado
        let litFlames = min(7, streakCount)
        HStack {
            Image(litFlames >= 1 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
            Image(litFlames >= 2 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
            Image(litFlames >= 3 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
            Image(litFlames >= 4 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
            Image(litFlames >= 5 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
            Image(litFlames >= 6 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
            Image(litFlames >= 7 ? "litFlame" : "unlitFlame").resizable().scaledToFit()
        }
    }
}
