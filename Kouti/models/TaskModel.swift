//
//  TaskModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct TaskModel: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let tag: Category
    let frequency: Set<Days>
    var notifications: [DateComponents] = []
    let monster: MonsterModel
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
    
    static func ==(lhs: TaskModel, rhs: TaskModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func <(lhs: TaskModel, rhs: TaskModel) -> Bool {
        if (lhs.isComplete && !rhs.isComplete) {
            return false
        } else if (!lhs.isComplete && rhs.isComplete) {
            return true
        }
        return lhs.name < rhs.name
    }
    
    static func hasSameInfo(lhs: TaskModel, rhs: TaskModel) -> Bool {
        lhs.name == rhs.name &&
        lhs.tag == rhs.tag &&
        lhs.frequency == rhs.frequency &&
        lhs.notifications == rhs.notifications
    }
}
