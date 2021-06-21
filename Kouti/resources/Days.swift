//
//  Days.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

enum Days: Int, Equatable, CaseIterable {
    case sunday = 0,
         monday = 1,
         tuesday = 2,
         wednesday = 3,
         thursday = 4,
         friday = 5,
         saturday = 6
    
    func getDescription() -> String {
        switch self {
            case .sunday:
                return "Dom"
            case .monday:
                return "Seg"
            case .tuesday:
                return "Ter"
            case .wednesday:
                return "Qua"
            case .thursday:
                return "Qui"
            case .friday:
                return "Sex"
            case .saturday:
                return "Sab"
        }
    }
}
