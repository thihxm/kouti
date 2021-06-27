//
//  UserModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct UserModel: Codable {
    var character: CharacterModel
    var tasks: [TaskModel]
    var streak: Int
}
