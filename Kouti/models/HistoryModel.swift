//
//  HistoryModel.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

struct HistoryModel: Codable {
    var history: [Date: [TaskModel]]
}
