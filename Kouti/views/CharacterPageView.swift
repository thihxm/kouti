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
            HStack (alignment: .bottom){
                Character(equipedItems: $userManager.user.character.inventory.equipedItems,
                          hairColor: $userManager.hairColor, skinColor: $userManager.skinColor)
                    .scaleEffect(1.5)
                    .offset(y: 50)
                    .rotation3DEffect(
                        .degrees(0),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                Spacer()
                VStack {
                    ColorPicker("Cor de pele", selection: $userManager.skinColor, supportsOpacity: false)
                    ColorPicker("Cor do cabelo", selection: $userManager.hairColor, supportsOpacity: false)
                }
            }
            .padding()
            CharacterInfoDisplay()
                .shadow(color: .black.opacity(0.2), radius: 20, y: 5)
                .padding(.bottom)
        }
        .background(Background(rectOffset: CGSize(width: 0, height: 156)))
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

struct CharacterPageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPageView()
            .environmentObject(UserManager.fullState())
        CharacterPageView()
            .environmentObject(UserManager.emptyState())
    }
}
