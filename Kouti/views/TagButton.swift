//
//  TagButton.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

struct TagButton: View {
    @Environment(\.colorScheme) var colorScheme

    let category: Category
    let hasBorder: Bool
    let action: () -> Void
    
    init(_ category: Category, hasBorder: Bool = true, action: @escaping () -> Void) {
        self.category = category
        self.hasBorder = hasBorder
        self.action = action
    }
    
    var body: some View {
        Button(action: action,label: {
            Text(category.rawValue)
                .font(.body)
                .foregroundColor(category.getColor())
                .fontWeight(.semibold)
        })
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .background(colorScheme == .dark ? Color("light1"): Color("light4")
        )
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(color: Color("dark4"), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(category.getColor(), lineWidth: self.hasBorder ? 2 : 0)
        )
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(.health, hasBorder: true, action: {})
    }
}
