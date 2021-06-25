//
//  CharacterInfoDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct CharacterInfoDisplay: View {
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack {
//            HEADER ENTRA AQUI
//            CharacterHeader(user: user)
            TabView {
                BestiaryGrid(bestiary: userManager.user.character.bestiary)
                ItemsGrid(items: userManager.user.character.inventory.items)
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(Color("light3"))
            .cornerRadius(40)
            .padding([.top, .horizontal])
        }
    }
}

struct CharacterInfoDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoDisplay(userManager: UserManager.fullState())
    }
}
