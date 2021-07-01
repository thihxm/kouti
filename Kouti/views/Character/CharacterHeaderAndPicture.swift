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
        HStack (alignment: .center, spacing: 25) {
            VStack {
                Character(equipedItems: $userManager.user.character.inventory.equipedItems, hairColor: $userManager.hairColor, skinColor: $userManager.skinColor)
                    .scaledToFill()
                    .scaleEffect(2)
                    .offset(x: 0, y: 110)
                    .frame(width: 103, height: 103)
                    .background(Image("bgCharacter").offset(x: -30, y: 40))
                    .clipShape(Circle())
                    .rotation3DEffect(
                        .degrees(0),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
            }
            .frame(width: 125, height: 125)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
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
