//
//  CharacterPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 23/06/21.
//

import SwiftUI

struct CharacterPageView: View {
    @Binding var user: UserModel
    
    var body: some View {
        VStack (spacing: 0) {
            HStack (alignment: .center){
                Character(equipedItems: $user.character.inventory.equipedItems)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                CharacterHeader(user: user)
            }
            .padding()
            CharacterInfoDisplay(user: $user)
                .padding(.bottom)
        }.background(Color("bg1")
            .edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
