//
//  ItemType.swift
//  Kouti
//
//  Created by Marco Zulian on 18/06/21.
//

import Foundation

//enum ItemType {
//    case top,
//         bottom,
//         hat,
//         powerUp,
//         sticker
//}

// TODO: A alteração com rawValue é temporária, para testar TelaPersonagemCompras. Voltar ao original quando itens tiverem nomes e representações definitivas
enum ItemType: String, Codable {
    case top = "camiseta",
         bottom = "calca",
         hat = "chapeu",
         powerUp = "powerUp",
         sticker = "adesivo",
         title = "titulo",
         hair = "cabelo"
}
