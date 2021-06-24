//
//  CharacterPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 23/06/21.
//

import SwiftUI

struct CharacterPageView: View {
    @State var user: UserModel
    
    var body: some View {
        let title = user.character.inventory.equipedItems.filter { $0.type == .title }.first
        VStack (spacing: 0) {
            HStack (alignment: .center){
                Character(equipedItems: user.character.inventory.equipedItems)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading) {
                    Text("\(user.character.name)")
                        .font(.headline)
                    Text("\(title?.name ?? "")")
                        .font(.subheadline)
                    ExperienceBar(character: $user.character)
                        .padding(.top)
                    StreakDisplay(streakCount: $user.streak)
                }.padding(.trailing)
            }
            .padding()
            CharacterInfoDisplay(user: user)
                .padding(.bottom)
        }.background(Color("bg1").edgesIgnoringSafeArea(.all))
    }
}

struct CharacterPageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPageView(user:
                            UserModel(character:
                                CharacterModel(name: "Camaradinha",
                                               level: 12,
                                               experience: 3000,
                                               money: 10,
                                               inventory:
                                                InventoryModel(
                                                    items: [
                                                        ItemModel(name: "ItemA", type: .top, price: 10, amount: 1),
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
                                                    equipedItems: [ItemModel(name: "Semideus Atlantico", type: .title, price: 0)]),
                                               bestiary: BestiaryModel(
                                                monsterCollection:
                                                    [MonsterModel(name: "1", category: .health, titles: []) : 1,
                                                     MonsterModel(name: "2", category: .health, titles: []) : 0,
                                                     MonsterModel(name: "3", category: .entertainment, titles: []) : 3,
                                                     MonsterModel(name: "4", category: .learning, titles: []) : 0,
                                                     MonsterModel(name: "5", category: .learning, titles: []) : 3,
                                                     MonsterModel(name: "6", category: .financial, titles: []) : 5,
                                                     MonsterModel(name: "7", category: .work, titles: []) : 2])),
                                      tasks: [TaskModel(
                                                name: "Beber água",
                                                tag: .health,
                                                frequency:Set([.monday,.friday,.saturday,.sunday,.wednesday]),
                                                notifications: [],
                                                monster:
                                                    MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Ler Harry Potter",
                                                tag: .entertainment,
                                                frequency:Set([.monday,.tuesday]),
                                                 notifications: [],
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Guardar dinheiro",
                                                 tag: .financial,
                                                 frequency:Set([.friday]),
                                                 notifications: [],
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Meditar",
                                                 tag: .health,
                                                frequency:Set([.monday,.tuesday,.friday,.saturday,.sunday,.thursday,.wednesday]),
                                                 notifications: [],
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Estudar",
                                                tag: .learning,
                                                frequency:Set([.monday,.friday,.wednesday]),
                                                 notifications: [],
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Entregar relatório",
                                                tag: .work,
                                                frequency:Set([.thursday]),
                                                 notifications: [],
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true)
                                            ],
                                      streak: 15)
        )
    }
}
