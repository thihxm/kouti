//
//  CharacterPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 23/06/21.
//

import SwiftUI

struct CharacterPageView: View {
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack (spacing: 0) {
            HStack (alignment: .center){
                Character(equipedItems: $userManager.user.character.inventory.equipedItems,
                          hairColor: $userManager.hairColor, skinColor: $userManager.skinColor)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                VStack {
                    ColorPicker("Pele", selection: $userManager.skinColor, supportsOpacity: false)
                    ColorPicker("Cabelo", selection: $userManager.hairColor, supportsOpacity: false)
                }
            }
            .padding()
            CharacterInfoDisplay(userManager: userManager)
                .padding(.bottom)
        }.background(Color("bg1")
        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onChange(of: userManager.skinColor, perform: { value in
            userManager.changeSkinColor(to: value)
        })
        .onChange(of: userManager.hairColor, perform: { value in
            userManager.changeHairColor(to: value)
        })
    }
}

//struct CharacterPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterPageView(userManager: UserManager.fullState())
//        CharacterPageView(userManager: UserManager.emptyState())
//    }
//}
