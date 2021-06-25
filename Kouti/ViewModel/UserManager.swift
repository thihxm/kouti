//
//  UserManager.swift
//  Kouti
//
//  Created by Thiago Medeiros on 24/06/21.
//

import Foundation
//import SwiftUI

class UserManager: ObservableObject {
    
    /*
     var character: CharacterModel
     var tasks: [TaskModel]
     var streak: Int
     */

    @Published var user: UserModel
    @Published var history: HistoryModel
    
    required init() {
        let inventory = InventoryModel(items: [], equipedItems: [])
        let bestiary = BestiaryModel(monsterCollection: [:])
        let character = CharacterModel(name: "", level: 0, experience: 0, money: 0, inventory: inventory, bestiary: bestiary)

        self.user = UserModel(character: character, tasks: [], streak: 0)
        self.history = HistoryModel(history: [:])
    }
    
    func addTask(task: TaskModel) {
        self.user.tasks.append(task)
    }
    
    func updateHistory() {
        let calendar = Calendar.current
        let today = calendar.component(.day, from: Date())
        let yesterday = calendar.date(from: DateComponents(day: today - 1, hour: 0, minute: 0, second: 0, nanosecond: 0))!

        for var task in self.user.tasks {
            if task.isComplete {
                self.history.history[yesterday]?.append(task)
                task.isComplete = false
            } else {
                self.user.streak = 0
            }
        }
    }
    
    static func emptyState() -> UserManager {
        let manager = UserManager()
        
        let inventory = InventoryModel(items: [], equipedItems: [])
        let bestiary = BestiaryModel(monsterCollection: [:])
        let character = CharacterModel(name: "Camaradinha", level: 0, experience: 0, money: 0, inventory: inventory, bestiary: bestiary)
        
        manager.user = UserModel(character: character, tasks: [], streak: 0)
        manager.history = HistoryModel(history: [:])
        
        return manager
    }
    
    static func fullState() -> UserManager {
        let manager = UserManager()

        let character = CharacterModel(
            name: "Camaradinha",
            level: 12,
            experience: 3000,
            money: 100,
            inventory: InventoryModel(
                items: [
                    ItemModel(name: "ItemA", type: .top, price: 10, amount: 1),
                    ItemModel(name: "ItemB", type: .top, price: 10, amount: 1),
                    ItemModel(name: "ItemC", type: .bottom, price: 10),
                    ItemModel(name: "ItemD", type: .bottom, price: 10, amount: 1),
                    ItemModel(name: "ItemE", type: .bottom, price: 10),
                    ItemModel(name: "ItemF", type: .bottom, price: 10, amount: 1),
                    ItemModel(name: "ItemG", type: .bottom, price: 10, amount: 1),
                    ItemModel(name: "ItemH", type: .hat, price: 10),
                    ItemModel(name: "ItemI", type: .hat, price: 10, amount: 1),
                    ItemModel(name: "ItemJ", type: .hat, price: 10),
                    ItemModel(name: "ItemK", type: .hat, price: 10, amount: 1),
                    ItemModel(name: "ItemL", type: .hat, price: 10),
                    ItemModel(name: "ItemM", type: .sticker, price: 10, amount: 1),
                    ItemModel(name: "ItemN", type: .sticker, price: 10),
                    ItemModel(name: "ItemO", type: .sticker, price: 10, amount: 3),
                    ItemModel(name: "ItemP", type: .sticker, price: 10, amount: 5),
                    ItemModel(name: "ItemQ", type: .sticker, price: 10)
                ],
                equipedItems: []
            ),
            bestiary: BestiaryModel(
                monsterCollection: [MonsterModel(name: "1", category: .health, titles: []) : 1,
                                    MonsterModel(name: "2", category: .health, titles: []) : 0,
                                    MonsterModel(name: "3", category: .entertainment, titles: []) : 3,
                                    MonsterModel(name: "4", category: .learning, titles: []) : 0,
                                    MonsterModel(name: "5", category: .learning, titles: []) : 3,
                                    MonsterModel(name: "6", category: .financial, titles: []) : 5,
                                    MonsterModel(name: "7", category: .work, titles: []) : 2]
            )
        )
        let tasks = [
            TaskModel(
                name: "Beber água",
                tag: .health,
                frequency:Set([.monday,.friday,.saturday,.sunday,.wednesday]),
                notifications: [],
                monster:MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true
            ),
            TaskModel(
                name: "Ler Harry Potter",
                tag: .entertainment,
                frequency:Set([.monday,.tuesday]),
                notifications: [],
                monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true
            ),
            TaskModel(
                name: "Guardar dinheiro",
                tag: .financial,
                frequency:Set([.friday]),
                notifications: [],
                monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true
            ),
            TaskModel(
                name: "Meditar",
                tag: .health,
                frequency:Set([.monday,.tuesday,.friday,.saturday,.sunday,.thursday,.wednesday]),
                notifications: [],
                monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true
            ),
            TaskModel(
                name: "Estudar",
                tag: .learning,
                frequency:Set([.monday,.friday,.wednesday]),
                notifications: [],
                monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true
            ),
            TaskModel(
                name: "Entregar relatório",
                tag: .work,
                frequency:Set([.thursday]),
                notifications: [],
                monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true
            )
        ]
        
        manager.user = UserModel(character: character, tasks: tasks, streak: 17)
        manager.history = HistoryModel(history: [:])
        
        return manager
    }
}
