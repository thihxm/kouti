//
//  CharacterPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 23/06/21.
//

import SwiftUI

struct CharacterPageView: View {
    @State var userManager: UserManager
    
    var body: some View {
        let title = userManager.user.character.inventory.equipedItems.filter { $0.type == .title }.first
        VStack (spacing: 0) {
            HStack (alignment: .center){
                Character(equipedItems: userManager.user.character.inventory.equipedItems)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading) {
                    Text("\(userManager.user.character.name)")
                        .font(.headline)
                    Text("\(title?.name ?? "")")
                        .font(.subheadline)
                    ExperienceBar(character: $userManager.user.character)
                        .padding(.top)
                    StreakDisplay(streakCount: $userManager.user.streak)
                }.padding(.trailing)
            }
            .padding()
            CharacterInfoDisplay(userManager: userManager)
                .padding(.bottom)
        }.background(Color("bg1"))
    }
}

struct CharacterPageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPageView(userManager: UserManager.fullState())
        CharacterPageView(userManager: UserManager.emptyState())
    }
}
