//
//  Days.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import Foundation

enum Days: Int {
    case sunday = 0,
         monday,
         tuesday,
         wednesday,
         thursday,
         friday,
         saturday
    
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
