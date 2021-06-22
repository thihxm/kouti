//
//  TagSelector.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct TagSelector: View {
    @Binding var selectedCategories: Set<Category>
    
    init(_ selectedCategories: Binding<Set<Category>>) {
        self._selectedCategories = selectedCategories
    }
    
    func selectCategory(_ category: Category) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
            return
        }
        selectedCategories.insert(category)
    }
    
    @ViewBuilder
    func tagButtonBuilder(category: Category) -> some View {
        if (selectedCategories.contains(category)) {
            Tag(category.rawValue, hasBorder: false, textColor: Color("light4"), bgColor: Color("bg1"))
        } else {
            Tag(category.rawValue, hasBorder: false)
        }
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 11) {
                ForEach(Category.allCases, id: \.self) { category in
                    Button(action: {selectCategory(category)}, label: {
                        tagButtonBuilder(category: category)
                    })
                }
            }.padding(6)
        }
    }
}

//struct TagSelector_Previews: PreviewProvider {
//    static var previews: some View {
//        TagSelector(State<Set<Category>>(initialValue: Set<Category>()))
//    }
//}

