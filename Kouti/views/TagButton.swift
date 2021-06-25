//
//  TagButton.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

struct TagButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var activeCategory: Category?

    let category: Category
    let hasBorder: Bool
    
    init(_ category: Category, hasBorder: Bool = false, activeCategory: Binding<Category?>) {
        self.category = category
        self.hasBorder = hasBorder
        self._activeCategory = activeCategory
    }
    
    func isActive() -> Bool {
        return activeCategory == category
    }
    
    func getButtonBackgroundColor() -> Color {
        if hasBorder {
            if isActive() {
                return category.getColor()
            }
            return colorScheme == .dark ? Color("light1") : Color("light4")
        }
        return isActive() ? category.getColor().opacity(0.8) : Color("grayBgButtons")
    }
    
    func getTextColor() -> Color {
        if hasBorder {
            if isActive() {
                return colorScheme == .dark ? Color("light1") : Color("light4")
            }
            return category.getColor()
        }
        return Color("dark2")
    }
    
    func onClick() {
        activeCategory = category
    }
    
    var body: some View {
        Button(action: onClick) {
            Tag(category.rawValue, hasBorder: false, textColor: getTextColor(), bgColor: getButtonBackgroundColor())
        }
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(.health, hasBorder: false, activeCategory: .constant(.health))
    }
}
