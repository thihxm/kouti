//
//  ItemsGrid.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct ItemsGrid: View {
    @State var items: [ItemModel]
    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack(alignment: .leading) {
            Tag("Compras", hasBorder: false)
            itemsDisplay()
        }.padding()
    }
    
    @ViewBuilder
    func itemsDisplay() -> some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(items, id: \.name) { item in
                    itemIcon(for: item)
                }
            }
        }
    }
    
    @ViewBuilder
    func itemIcon(for item: ItemModel) -> some View {
        if (item.amount == 0) {
            Image("\(item.type.rawValue)_cheio")
                .resizable()
                .padding(10)
                .opacity(0.5)
        } else if (item.amount == 1) {
            Image("\(item.type.rawValue)_cheio")
                .resizable()
                .padding(10)
        } else {
            Image("\(item.type.rawValue)_cheio")
                .resizable()
                .padding(10)
                .overlay(Circle()
                    .foregroundColor(Color("bg3"))
                            .overlay(Text("\(item.amount)"))
                            .frame(width: 25, height: 25, alignment: .topTrailing)
                            .offset(x: 25, y: 25))
        }
    }
}


struct ItemsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ItemsGrid(items: UserManager.fullState().user.character.inventory.items)
    }
}
