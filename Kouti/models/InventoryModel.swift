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
    
    static func emptyInventory() -> InventoryModel {
        InventoryModel(items: [ItemModel(name: "coroa", type: .hat, price: 100),
                               ItemModel(name: "cabelo1", type: .hair, price: 100),
                               ItemModel(name: "cabelo2", type: .hair, price: 100),
                               ItemModel(name: "cabelo3", type: .hair, price: 100),
                               ItemModel(name: "cabelo4", type: .hair, price: 100),
                                ItemModel(name: "camiseta0", type: .top, price: 100),
                                ItemModel(name: "camiseta1", type: .top, price: 100),
                                ItemModel(name: "camiseta2", type: .top, price: 100),
                                ItemModel(name: "camiseta3", type: .top, price: 100),
                                ItemModel(name: "camiseta4", type: .top, price: 100),
                                ItemModel(name: "vestido1", type: .top, price: 100),
                                ItemModel(name: "calca1", type: .bottom, price: 100),
                                ItemModel(name: "calca2", type: .bottom, price: 100),
                                ItemModel(name: "pocao1", type: .powerUp, price: 100),
                                ItemModel(name: "pocao2", type: .powerUp, price: 100),
                                ItemModel(name: "pocao3", type: .powerUp, price: 100)],
                       equipedItems: [])
    }
    
    static func fullInventory() -> InventoryModel {
        InventoryModel(items: [ItemModel(name: "coroa", type: .hat, price: 100, amount: 1),       ItemModel(name: "cabelo1", type: .hair, price: 100, amount: 1),
                               ItemModel(name: "cabelo2", type: .hair, price: 100, amount: 1),
                               ItemModel(name: "cabelo3", type: .hair, price: 100, amount: 1),
                               ItemModel(name: "cabelo4", type: .hair, price: 100, amount: 1),
                                ItemModel(name: "camiseta0", type: .top, price: 100, amount: 1),
                                ItemModel(name: "camiseta1", type: .top, price: 100, amount: 1),
                                ItemModel(name: "camiseta2", type: .top, price: 100, amount: 1),
                                ItemModel(name: "camiseta3", type: .top, price: 100, amount: 1),
                                ItemModel(name: "camiseta4", type: .top, price: 100, amount: 1),
                                ItemModel(name: "vestido1", type: .top, price: 100, amount: 1),
                                ItemModel(name: "calca1", type: .bottom, price: 100, amount: 1),
                                ItemModel(name: "calca2", type: .bottom, price: 100, amount: 1),
                                ItemModel(name: "pocao1", type: .powerUp, price: 100, amount: 1),
                                ItemModel(name: "pocao2", type: .powerUp, price: 100, amount: 1),
                                ItemModel(name: "pocao3", type: .powerUp, price: 100, amount: 1)],
                       equipedItems: [])
    }
}
