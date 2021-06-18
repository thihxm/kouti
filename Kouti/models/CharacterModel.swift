//
//  CharacterModel.swift
//  Kouti
//
//  Created by Marco Zulian on 18/06/21.
//

import Foundation

struct CharacterModel {
    var name: String
    var level: Int
    var experience: Int
    var money: Int
    var inventory: InventoryModel
    var bestiary: Bestiary
    
    mutating func receiveExperience(amount: Int) {
        let experienceNeededForLevel = Int(pow(Double(2), Double(level)))
        let newExperienceValue = experience + amount
        
        if (newExperienceValue > experienceNeededForLevel) {
            experience =  newExperienceValue - experienceNeededForLevel
            level += 1
        }
        else {
            experience = newExperienceValue
        }
    }
}
