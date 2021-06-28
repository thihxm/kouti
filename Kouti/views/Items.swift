//
//  ItemsGrid.swift
//  Kouti
//
//  Created by Marco Zulian on 21/06/21.
//

import SwiftUI

struct ItemsGrid: View {
    @ObservedObject var userManager: UserManager
    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack(alignment: .leading) {
            Tag("Inventário", hasBorder: false)
            itemsDisplay()
        }.padding()
    }
    
    @ViewBuilder
    func itemsDisplay() -> some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(userManager.user.character.inventory.items, id: \.name) { item in
                    if item.type != .powerUp {
                        itemIcon(for: item)
                    } else {
                        powerUpIcon(for: item)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func itemIcon(for item: ItemModel) -> some View {
        if (item.amount == 0) {
            Image("\(item.name)_icone")
                .resizable()
                .padding(10)
                .opacity(0.5)
        } else if (userManager.user.character.inventory.equipedItems.contains(item)) {
            Button(action: { userManager.unequipItem(item) })
            {
                Image("\(item.name)_icone")
                    .resizable()
                    .padding(10)
                    .overlay(Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(Color("green"))
                                .offset(x: 25, y: 25))
            }
        } else {
            Button(action: { userManager.equipItem(item) })
            {
                Image("\(item.name)_icone")
                    .resizable()
                    .padding(10)
            }
        }
    }
    
    @ViewBuilder
    func powerUpIcon(for item: ItemModel) -> some View {
        if (item.amount == 0) {
            Image("\(item.name)_icone")
                .resizable()
                .padding(10)
                .opacity(0.5)
        } else if (item.amount == 1) {
            Image("\(item.name)_icone")
                .resizable()
                .padding(10)
        } else {
            Image("\(item.name)_icone")
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
