//
//  Tag.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct Tag: View {
    @Environment(\.colorScheme) var colorScheme
    
    let label: String
    let hasBorder: Bool
    let textColor: Color
    let bgColor: Color
    
    init(_ label: String, hasBorder: Bool, textColor: Color = Color("dark2"), bgColor: Color = Color("grayBgButtons")) {
        self.label = label
        self.hasBorder = hasBorder
        self.textColor = textColor
        self.bgColor = bgColor
    }
    
    var body: some View {
        Text(label)
            .font(.body)
            .foregroundColor(textColor)
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .shadow(color: Color("dark4"), radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(textColor, lineWidth: self.hasBorder ? 2 : 0)
            )
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        Tag("Cabeça", hasBorder: true)
    }
}
