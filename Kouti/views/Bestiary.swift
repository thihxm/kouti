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
            Tag("Bestiário", hasBorder: false)
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
                                .foregroundColor(monster.category.getColor())
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
        BestiaryGrid(bestiary: BestiaryModel(
                        monsterCollection:
                            [MonsterModel(name: "1", category: .health, titles: []) : 1,
                             MonsterModel(name: "2", category: .health, titles: []) : 0,
                             MonsterModel(name: "3", category: .entertainment, titles: []) : 3,
                             MonsterModel(name: "4", category: .learning, titles: []) : 0,
                             MonsterModel(name: "5", category: .learning, titles: []) : 3,
                             MonsterModel(name: "6", category: .financial, titles: []) : 5,
                             MonsterModel(name: "7", category: .work, titles: []) : 2]))
    }
}
