//
//  MonsterModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct MonsterModel: Hashable {
    let id = UUID()
    let name: String
    let description: String = ""
    let category: Category
    let titles: [TitleModel]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MonsterModel, rhs: MonsterModel) -> Bool {
        return lhs.id == rhs.id
    }
}
