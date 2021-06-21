//
//  CharacterPageInfoContainer.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct CharacterPageInfoContainer<Content: View>: View {
    let title: String
    let content: () -> Content
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // TODO: Consumir do TagButton ao invés de repetir
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 2)
                    )
                content()
            }.padding()
        }.padding()
    }
}
