//
//  CharacterHeader.swift
//  Kouti
//
//  Created by Marco Zulian on 24/06/21.
//

import SwiftUI

struct CharacterHeader: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        let title = userManager.user.character.inventory.equipedItems.filter { $0.type == .title }.first
        LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading) {
            Text("\(userManager.user.character.name)")
                .font(.headline)
            Text("\(title?.name ?? "")")
                .font(.subheadline)
            ExperienceBar(character: $userManager.user.character)
                .padding(.top)
            StreakDisplay(streakCount: $userManager.user.streak)
        }.foregroundColor(.white)
    }
}


struct CharacterHeader_Previews: PreviewProvider {
    static var previews: some View {
        CharacterHeader()
            .environmentObject(UserManager.fullState())
    }
}
