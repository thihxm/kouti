//
//  ExperienceBar.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct ExperienceBar: View {
    @Binding var character: CharacterModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Nv. \(character.level)")
                .font(.system(size: 13, weight: .bold, design: .default))
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .foregroundColor(.white)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: CGFloat(character.percentageExperience)*geometry.size.width, height: geometry.size.height)
                        .foregroundColor(.black)
                }.animation(.easeOut)
            }
            HStack {
                Spacer()
                Text("\(character.experience) / \(character.experienceNeededForLevel)")
                    .font(.caption)
            }
        }.frame(maxHeight: 47)
    }
}

// Pra usar o preview precisa alterar @Binding para @State na linha 11 e descomentar abaixo
//struct ExperienceBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ExperienceBar(character: CharacterModel(name: "Camaradinha", level: 12, experience: 3000, money: 10, inventory: InventoryModel(items: [], equipedItems: []), bestiary: BestiaryModel(monsterCollection: [:])))
//    }
//}
