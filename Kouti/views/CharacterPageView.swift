//
//  CharacterPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 23/06/21.
//

import SwiftUI

struct CharacterPageView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack (spacing: 0) {
            HStack (alignment: .center){
                Character(equipedItems: $userManager.user.character.inventory.equipedItems)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                CharacterHeader()
            }
            .padding()
            CharacterInfoDisplay()
                .padding(.bottom)
        }.background(Color("bg1")
        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CharacterPageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPageView()
            .environmentObject(UserManager.fullState())
        CharacterPageView()
            .environmentObject(UserManager.emptyState())
    }
}
