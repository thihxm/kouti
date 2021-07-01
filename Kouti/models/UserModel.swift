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
    
    func getMissionsFor(_ day: Date) -> [TaskModel] {
        let calendar = Calendar.current
        let weekday = calendar.dateComponents([.weekday], from: day).weekday!
        return tasks.filter { $0.frequency.contains(Days(rawValue: weekday - 1)!) }
    }
}
