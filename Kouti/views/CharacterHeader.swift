//
//  CharacterHeader.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct CharacterHeader: View {
    @State var user: UserModel

    // TODO: Ajustar alinhamentos e imagem do perfil
    var body: some View {
        let title = user.character.inventory.equipedItems.filter { $0.type == .title }.first
        HStack (alignment: .top, spacing: 25) {
            Character(equipedItems: user.character.inventory.equipedItems)
                .scaledToFill()
                .offset(x: 0, y: 50)
                .frame(width: 125, height: 125)
                .clipShape(Circle())
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0))
            LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading) {
//            VStack(alignment: .leading, spacing: 0) {
                Text("\(user.character.name)")
                    .font(.headline)
                Text("\(title?.name ?? "")")
                    .font(.subheadline)
                ExperienceBar(character: $user.character)
                    .padding(.top)
                StreakDisplay(streakCount: $user.streak)
            }
        }
    }
}

struct CharacterHeader_Previews: PreviewProvider {
    static var previews: some View {
        CharacterHeader(user: UserModel(character: CharacterModel(name: "Camaradinha", level: 12, experience: 3000, money: 10, inventory: InventoryModel(items: [], equipedItems: [ItemModel(name: "Semideus Atlantico", type: .title, price: 0)]), bestiary: BestiaryModel(monsterCollection: [:])), tasks: [], streak: 15))
    }
}
