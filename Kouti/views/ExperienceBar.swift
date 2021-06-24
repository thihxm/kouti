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
