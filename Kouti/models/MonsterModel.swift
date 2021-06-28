//
//  MonsterModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct MonsterModel: Hashable, Codable {
    var id = UUID()
    let name: String
    let category: Category
    // TODO: Modificacao do titles de TitleModel para String. Fazer o TitleModel atender ao protocolo Enodable e Decodable para conseguir retornar ao original
    let titles: [String]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MonsterModel, rhs: MonsterModel) -> Bool {
        return lhs.id == rhs.id
    }
}
