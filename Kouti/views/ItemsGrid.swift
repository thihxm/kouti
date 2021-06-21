//
//  ItemsGrid.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct ItemsGrid: View, Identifiable {
    let id = UUID()
    @State var items: [ItemModel]
    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        CharacterPageInfoContainer(title: "Compras", content: itemsDisplay)
    }
    
    @ViewBuilder
    func itemsDisplay() -> some View {
        LazyVGrid(columns: columns, alignment: .center) {
            ForEach(items, id: \.name) { item in
                itemIcon(for: item)
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
        ItemsGrid(items: [ItemModel(name: "ItemA", type: .top, price: 10, amount: 1),
                ItemModel(name: "ItemB", type: .top, price: 10, amount: 1),
                ItemModel(name: "ItemC", type: .bottom, price: 10),
                ItemModel(name: "ItemD", type: .bottom, price: 10, amount: 1),
                ItemModel(name: "ItemE", type: .bottom, price: 10),
                ItemModel(name: "ItemF", type: .bottom, price: 10, amount: 1),
                ItemModel(name: "ItemG", type: .bottom, price: 10, amount: 1),
                ItemModel(name: "ItemH", type: .hat, price: 10),
                ItemModel(name: "ItemI", type: .hat, price: 10, amount: 1),
                ItemModel(name: "ItemJ", type: .hat, price: 10),
                ItemModel(name: "ItemK", type: .hat, price: 10, amount: 1),
                ItemModel(name: "ItemL", type: .hat, price: 10),
                ItemModel(name: "ItemM", type: .sticker, price: 10, amount: 1),
                ItemModel(name: "ItemN", type: .sticker, price: 10),
                ItemModel(name: "ItemO", type: .sticker, price: 10, amount: 3),
                ItemModel(name: "ItemP", type: .sticker, price: 10, amount: 5),
                ItemModel(name: "ItemQ", type: .sticker, price: 10),])
    }
}
