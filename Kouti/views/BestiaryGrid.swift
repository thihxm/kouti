//
//  BestiaryGrid.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct BestiaryGrid: View, Identifiable {
    let id = UUID()
    let bestiary: BestiaryModel
    
    var columns: [GridItem] =
        Array(repeating: .init(.adaptive(minimum: 50)), count: 3)
    
    var body: some View {
        CharacterPageInfoContainer(title: "Bestiario", content: bestiatyDisplay)
    }
    
    @ViewBuilder
    func bestiatyDisplay() -> some View {
        LazyVGrid(columns: columns) {
            ForEach(bestiary.monsterCollection.sorted{ $0.key.name < $1.key.name }, id: \.key) { key, value in
                monsterSticker(for: key, times: value)
            }
        }
    }
    
    @ViewBuilder
    func monsterSticker(for monster: MonsterModel, times: Int = 0) -> some View {
        if (times > 0) {
            ZStack {
                Image("nomeMonstro_cheio")
                    .overlay(Circle()
                                .foregroundColor(monster.category.getColor())
                                .overlay(Text("\(times)"))
                                .frame(width: 25, height: 25, alignment: .topTrailing)
                                .offset(x: 25, y: 25))
            }
        }
        else {
            Image("nomeMonstro_vazio")
        }
    }
}

struct BestiaryGrid_Previews: PreviewProvider {
    static var previews: some View {
        BestiaryGrid(bestiary: BestiaryModel(
                        monsterCollection:
                            [MonsterModel(name: "MonstroA", category: .health, titles: []) : 1,
                             MonsterModel(name: "MonstroB", category: .health, titles: []) : 0,
                             MonsterModel(name: "MonstroC", category: .entertainment, titles: []) : 3,
                             MonsterModel(name: "MonstroD", category: .entertainment, titles: []) : 2,
                             MonsterModel(name: "MonstroE", category: .entertainment, titles: []) : 10,
                             MonsterModel(name: "MonstroF", category: .financial, titles: []) : 5,
                             MonsterModel(name: "MonstroG", category: .financial, titles: []) : 2,
                             MonsterModel(name: "MonstroH", category: .financial, titles: []) : 7,
                             MonsterModel(name: "MonstroI", category: .financial, titles: []) : 0,
                             MonsterModel(name: "MonstroJ", category: .learning, titles: []) : 0,
                             MonsterModel(name: "MonstroK", category: .learning, titles: []) : 0,
                             MonsterModel(name: "MonstroL", category: .learning, titles: []) : 2,
                             MonsterModel(name: "MonstroM", category: .learning, titles: []) : 3,
                             MonsterModel(name: "MonstroN", category: .learning, titles: []) : 1,
                             MonsterModel(name: "MonstroO", category: .work, titles: []) : 5,
                             MonsterModel(name: "MonstroP", category: .work, titles: []) : 2,
                             MonsterModel(name: "MonstroQ", category: .work, titles: []) : 3,
                             MonsterModel(name: "MonstroR", category: .work, titles: []) : 0,
                             MonsterModel(name: "MonstroS", category: .work, titles: []) : 0,
                             MonsterModel(name: "MonstroT", category: .work, titles: []) : 0]))
    }
}
