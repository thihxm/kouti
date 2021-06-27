//
//  Categories.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation
import SwiftUI

enum Category: String, Equatable, CaseIterable, Codable {
    case health = "Saúde",
         entertainment = "Entretenimento",
         learning = "Aprendizado",
         work = "Trabalho",
         financial = "Financeiro"
    
    func getColor() -> Color {
        switch self {
        case .financial:
            return Color("yellow")
        case .entertainment:
            return Color("red")
        case .learning:
            return Color("purple")
        case .work:
            return Color("blue")
        default: // Health is set as default
            return Color("green")
        }
    }
}
