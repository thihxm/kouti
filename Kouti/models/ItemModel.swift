//
//  ItemModel.swift
//  Kouti
//
//  Created by Marco Zulian on 18/06/21.
//

import Foundation

struct ItemModel {
    var name: String
    var type: ItemType
    var price: Int
    var amount: Int = 0
}

extension ItemModel: Equatable {
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        lhs.name == rhs.name && lhs.type == rhs.type
    }
}
