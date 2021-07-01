//
//  BestiaryModel.swift
//  Kouti
//
//  Created by Marco Zulian on 18/06/21.
//

import Foundation

struct BestiaryModel: Codable {
    var monsterCollection: [MonsterModel: Int]
    
    static func emptyBestiary() -> BestiaryModel {
        BestiaryModel(
            monsterCollection: [MonsterModel(name: "1", titles: []) : 0,
                                MonsterModel(name: "2", titles: []) : 0,
                                MonsterModel(name: "3", titles: []) : 0,
                                MonsterModel(name: "4", titles: []) : 0])
    }
    
    static func halfInventory() -> BestiaryModel {
        BestiaryModel(
            monsterCollection: [MonsterModel(name: "1", titles: []) : 3,
                                MonsterModel(name: "2", titles: []) : 1,
                                MonsterModel(name: "3", titles: []) : 0,
                                MonsterModel(name: "4", titles: []) : 0])
    }
    
    static func fullBestiary() -> BestiaryModel {
        BestiaryModel(
            monsterCollection: [MonsterModel(name: "1", titles: []) : 0,
                                MonsterModel(name: "2", titles: []) : 2,
                                MonsterModel(name: "3", titles: []) : 3,
                                MonsterModel(name: "4", titles: []) : 0])
    }
}

