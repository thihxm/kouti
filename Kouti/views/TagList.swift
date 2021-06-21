//
//  TagList.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct TagList: View {
    var hasBorder: Bool = false
    @State var selectedCategory: Category = .health
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 11) {
                ForEach(Category.allCases, id: \.self) { category in
                    TagButton(category, hasBorder: hasBorder, activeCategory: $selectedCategory)
                }
            }.padding(6)
        }
    }
}

struct TagList_Previews: PreviewProvider {
    static var previews: some View {
        TagList()
    }
}
