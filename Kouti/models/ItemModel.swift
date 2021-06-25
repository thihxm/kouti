//
//  ItemModel.swift
//  Kouti
//
//  Created by Marco Zulian on 18/06/21.
//

import Foundation

struct ItemModel: Equatable {
    var name: String
    var type: ItemType
    var price: Int
    var amount: Int = 0
    
    static func ==(lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type
    }
}
