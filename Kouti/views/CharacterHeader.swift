//
//  CharacterHeader.swift
//  Kouti
//
//  Created by Marco Zulian on 24/06/21.
//

import SwiftUI

struct CharacterHeader: View {
    @State var user: UserModel
    
    var body: some View {
        let title = user.character.inventory.equipedItems.filter { $0.type == .title }.first
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
