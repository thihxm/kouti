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
