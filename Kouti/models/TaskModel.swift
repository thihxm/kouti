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
    let monster: MosterModel
}
