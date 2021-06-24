//
//  TaskModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct TaskModel {
    var name: String
    var tag: Category
    var frequency: Set<Days>
    var notifications: [DateComponents] = []
    var monster: MonsterModel
    var isComplete: Bool = false
    
    func frequencyDescription() -> String {
        if frequency.count == 7 {
            return "Todos os dias"
        }
        return frequency
            .sorted { $0.rawValue < $1.rawValue }
            .map { $0.getDescription() }
            .joined(separator: " - ")
    }
}
