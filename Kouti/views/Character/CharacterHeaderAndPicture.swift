//
//  CharacterHeaderAndPicture.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct CharacterHeaderAndPicture: View {
    @EnvironmentObject var userManager: UserManager

    // TODO: Ajustar alinhamentos e imagem do perfil
    var body: some View {
        HStack (alignment: .top, spacing: 25) {
            Character(equipedItems: $userManager.user.character.inventory.equipedItems, hairColor: $userManager.hairColor, skinColor: $userManager.skinColor)
                .scaledToFill()
                .offset(x: 0, y: 50)
                .frame(width: 125, height: 125)
                .clipShape(Circle())
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0))
            CharacterHeader()
        }
    }
}

struct CharacterHeaderAndPicture_Previews: PreviewProvider {
    static var previews: some View {
        CharacterHeaderAndPicture()
            .environmentObject(UserManager.fullState())
    }
}
