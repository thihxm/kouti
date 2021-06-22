//
//  CharacterInfoDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct CharacterInfoDisplay: View {
    @State var user: UserModel
    
    var body: some View {
        VStack {
//            HEADER ENTRA AQUI
//            CharacterHeader(user: user)
            TabView {
                BestiaryGrid(bestiary: user.character.bestiary)
                ItemsGrid(items: user.character.inventory.items)
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .background(Color("bg1"))
            .cornerRadius(40)
            .padding([.top, .horizontal])
        }
    }
}

struct CharacterInfoDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoDisplay(user: UserModel(
            character: CharacterModel(
                                name: "Camaradinha",
                                level: 12,
                                experience: 3000,
                                money: 100,
                                inventory: InventoryModel(items: [ItemModel(name: "ItemA", type: .top, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemB", type: .top, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemC", type: .bottom, price: 10),
                                                                  ItemModel(name: "ItemD", type: .bottom, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemE", type: .bottom, price: 10),
                                                                  ItemModel(name: "ItemF", type: .bottom, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemG", type: .bottom, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemH", type: .hat, price: 10),
                                                                  ItemModel(name: "ItemI", type: .hat, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemJ", type: .hat, price: 10),
                                                                  ItemModel(name: "ItemK", type: .hat, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemL", type: .hat, price: 10),
                                                                  ItemModel(name: "ItemM", type: .sticker, price: 10, amount: 1),
                                                                  ItemModel(name: "ItemN", type: .sticker, price: 10),
                                                                  ItemModel(name: "ItemO", type: .sticker, price: 10, amount: 3),
                                                                  ItemModel(name: "ItemP", type: .sticker, price: 10, amount: 5),
                                                                  ItemModel(name: "ItemQ", type: .sticker, price: 10),],
                                                          equipedItems: []),
                                bestiary: BestiaryModel(monsterCollection:
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
                                                             MonsterModel(name: "MonstroT", category: .work, titles: []) : 0])),
                             tasks: [], streak: 4))
    }
}
