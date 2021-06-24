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
        VStack (spacing: 0) {
            HStack (alignment: .center){
                Character(equipedItems: $user.character.inventory.equipedItems)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                CharacterHeader(user: user)
            }
            .padding()
            CharacterInfoDisplay(user: $user)
                .padding(.bottom)
        }.background(Color("bg1")
            .edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
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
                                                                ItemModel(name: "coroa", type: .hat, price: 10, amount: 1),
                                                                ItemModel(name: "toga", type: .top, price: 10, amount: 1),
                                                                ItemModel(name: "pocao1", type: .powerUp, price: 10, amount: 1),
                                                                ItemModel(name: "pocao2", type: .powerUp, price: 10, amount: 5),
                                                                ItemModel(name: "pocao3", type: .powerUp, price: 10)],
                                                            equipedItems: [
                                                                ItemModel(name: "coroa", type: .hat, price: 10, amount: 1),]
                                                        ),
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
                                                monster:
                                                    MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Ler Harry Potter",
                                                tag: .entertainment,
                                                frequency:Set([.monday,.tuesday]),
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Guardar dinheiro",
                                                 tag: .financial,
                                                 frequency:Set([.friday]),
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Meditar",
                                                 tag: .health,
                                                frequency:Set([.monday,.tuesday,.friday,.saturday,.sunday,.thursday,.wednesday]),
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Estudar",
                                                tag: .learning,
                                                frequency:Set([.monday,.friday,.wednesday]),
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                                             TaskModel(
                                                 name: "Entregar relatório",
                                                tag: .work,
                                                frequency:Set([.thursday]),
                                                 monster:
                                                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true)
                                            ],
                                      streak: 15)
        )
    }
}
