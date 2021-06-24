//
//  CharacterInfoDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct CharacterInfoDisplay: View {
    @Binding var user: UserModel
    
    var body: some View {
        VStack {
            TabView {
                ItemsGrid(items: $user.character.inventory)
                BestiaryGrid(bestiary: user.character.bestiary)
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(Color("light3"))
            .cornerRadius(40)
            .padding([.top, .horizontal])
        }
    }
}

//struct CharacterInfoDisplay_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterInfoDisplay(user: UserModel(
//            character: CharacterModel(
//                                name: "Camaradinha",
//                                level: 12,
//                                experience: 3000,
//                                money: 100,
//                                inventory: InventoryModel(
//                                                        items: [
//                                                            ItemModel(name: "coroa", type: .top, price: 10, amount: 1),
//                                                            ItemModel(name: "toga", type: .bottom, price: 10, amount: 1),
//                                                            ItemModel(name: "pocao1", type: .powerUp, price: 10, amount: 1),
//                                                            ItemModel(name: "pocao2", type: .powerUp, price: 10, amount: 5),
//                                                            ItemModel(name: "pocao3", type: .powerUp, price: 10)],
//                                                        equipedItems: [
//                                                            ItemModel(name: "coroa", type: .top, price: 10, amount: 1),]
//                                                    ),
//                                bestiary: BestiaryModel(monsterCollection:
//                                                            [MonsterModel(name: "1", category: .health, titles: []) : 1,
//                                                             MonsterModel(name: "2", category: .health, titles: []) : 0,
//                                                             MonsterModel(name: "3", category: .entertainment, titles: []) : 3,
//                                                             MonsterModel(name: "4", category: .learning, titles: []) : 0,
//                                                             MonsterModel(name: "5", category: .learning, titles: []) : 3,
//                                                             MonsterModel(name: "6", category: .financial, titles: []) : 5,
//                                                             MonsterModel(name: "7", category: .work, titles: []) : 2])),
//                             tasks: [], streak: 4))
//    }
//}
