//
//  Bestiario.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct BestiaryGrid: View {
    let bestiary: BestiaryModel
    let columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        VStack(alignment: .leading) {
            Tag("Caixa de Pandora", hasBorder: false, textColor: .white, bgColor: Color("purpleGuide"))
            bestiatyDisplay()
        }.padding()
    }
    
    @ViewBuilder
    func bestiatyDisplay() -> some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(bestiary.monsterCollection.sorted{ $0.key.name < $1.key.name }, id: \.key) { key, value in
                    monsterSticker(for: key, times: value)
                }
            }
        }
    }
    
    @ViewBuilder
    func monsterSticker(for monster: MonsterModel, times: Int = 0) -> some View {
        if (times > 0) {
            ZStack {
                Image("sticker#\(monster.name)_filled")
                    .overlay(Circle()
                                .foregroundColor(Color("bg1"))
                                .overlay(Text("\(times)"))
                                .frame(width: 25, height: 25, alignment: .topTrailing)
                                .offset(x: 25, y: 25))
            }
        }
        else {
            Image("sticker#\(monster.name)_unfilled")
        }
    }
}


struct Bestiary_Previews: PreviewProvider {
    static var previews: some View {
        BestiaryGrid(bestiary: UserManager.fullState().user.character.bestiary)
    }
}
