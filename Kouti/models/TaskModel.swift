//
//  TaskModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct TaskModel {
    let name: String
    let tag: Category
    let frequency: Set<Days>
    let notifications: [DateComponents]
    let monster: MonsterModel
    var isComplete: Bool
    
    func frequencyDescription() -> String {
        if frequency.count == 7 {
            return "Todos os dias"
        }
        return frequency.map { $0.rawValue }.joined(separator: " - ")
    }
}
