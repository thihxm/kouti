//
//  TagButton.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

struct TagButton: View {
    let category: Category
    let hasBorder: Bool
    
    init(_ category: Category, hasBorder: Bool = true) {
        self.category = category
        self.hasBorder = hasBorder
    }
    
    var body: some View {
        VStack {
            Text(category.rawValue)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(category.getColor())
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color("light1"))
                        .shadow(color: Color("dark4"), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(category.getColor(), lineWidth: self.hasBorder ? 2 : 0)
                )
                
        }
        
        
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(.health, hasBorder: true)
            .preferredColorScheme(.dark)
    }
}
