//
//  CharacterInfoDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct CharacterInfoDisplay: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            TabView {
                ItemsGrid(userManager: userManager)
                BestiaryGrid(bestiary: userManager.user.character.bestiary)
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
        CharacterInfoDisplay()
            .environmentObject(UserManager.fullState())
    }
}
