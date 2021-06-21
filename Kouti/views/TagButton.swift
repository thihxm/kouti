//
//  TagButton.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

struct TagButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: Bool = false

    let category: Category
    let hasBorder: Bool
    let action: () -> Void
    
    init(_ category: Category, hasBorder: Bool = false, action: @escaping () -> Void) {
        self.category = category
        self.hasBorder = hasBorder
        self.action = action
    }
    
    func getButtonBackgroundColor() -> Color {
        if hasBorder {
            if isActive {
                return category.getColor()
            }
            return colorScheme == .dark ? Color("light1") : Color("light4")
        }
        return isActive ? Color("bg1") : Color("grayBgButtons")
    }
    
    func getTextColor() -> Color {
        if hasBorder {
            if isActive {
                return colorScheme == .dark ? Color("light1") : Color("light4")
            }
            return category.getColor()
        }
        return Color("dark2")
    }
    
    func onClick() {
        isActive.toggle()
        action()
    }
    
    var body: some View {
        Button(action: onClick,label: {
            Text(category.rawValue)
                .font(.body)
                .foregroundColor(getTextColor())
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(getButtonBackgroundColor())
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(color: Color("dark4"), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(category.getColor(), lineWidth: self.hasBorder ? 2 : 0)
                )
        })
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(.health, hasBorder: false, action: {})
            
    }
}
