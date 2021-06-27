//
//  InventoryModel.swift
//  Kouti
//
//  Created by Marco Zulian on 18/06/21.
//

import Foundation

struct InventoryModel: Codable {
    var items: [ItemModel]
    var equipedItems: [ItemModel]
    
    enum ItemError: Error {
        case itemNotFound
    }
    
    mutating func equipItem(_ passedItem: ItemModel) throws {
        guard let indexOfPassedItem = items.firstIndex(of: passedItem) else {
            throw ItemError.itemNotFound
        }
        
        var item = items[indexOfPassedItem]
        item.amount -= 1
        equipedItems.append(item)
    }
}
