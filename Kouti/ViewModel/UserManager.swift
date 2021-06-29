//
//  UserManager.swift
//  Kouti
//
//  Created by Thiago Medeiros on 24/06/21.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    
    /*
     var character: CharacterModel
     var tasks: [TaskModel]
     var streak: Int
     */

    @Published var user: UserModel
    @Published var history: HistoryModel
    @Published var skinColor: Color
    @Published var hairColor: Color
    @Published var isFirstLogin: Bool
    
    required init() {
        let inventory = InventoryModel.emptyInventory()
        let bestiary = BestiaryModel(monsterCollection: [:])
        let character = CharacterModel(name: "", level: 0, experience: 0, money: 0, inventory: inventory, bestiary: bestiary)
        self.user = UserModel(character: character, tasks: [], streak: 0)
        self.history = HistoryModel(history: [:])
        self.skinColor = .white
        self.hairColor = .white
        self.isFirstLogin = true
        
        if let data = UserDefaults.standard.data(forKey: "user") {
            if let decoded = try? JSONDecoder().decode(UserModel.self, from: data) {
                self.user = decoded
//                self.user.character.inventory = InventoryModel.fullInventory()
                self.user.character.bestiary = BestiaryModel(
                    monsterCollection: [MonsterModel(name: "1", category: .health, titles: []) : 1,
                                        MonsterModel(name: "2", category: .health, titles: []) : 0,
                                        MonsterModel(name: "3", category: .entertainment, titles: []) : 3,
                                        MonsterModel(name: "4", category: .learning, titles: []) : 0])
            }
        }
        if let data = UserDefaults.standard.data(forKey: "history") {
            if let decoded = try? JSONDecoder().decode(HistoryModel.self, from: data) {
                self.history = decoded
            }
        }
        if let data = UserDefaults.standard.data(forKey: "hairColor") {
            if let decoded = try? JSONDecoder().decode(Color.self, from: data) {
                self.hairColor = decoded
            }
        }
        if let data = UserDefaults.standard.data(forKey: "skinColor") {
            if let decoded = try? JSONDecoder().decode(Color.self, from: data) {
                self.skinColor = decoded
            }
        }
        if let data = UserDefaults.standard.data(forKey: "isFirstLogin") {
            if let decoded = try? JSONDecoder().decode(Bool.self, from: data) {
                self.isFirstLogin = decoded
            }
        }
    }
    
    func updateHistory() {
        print("Updating history")
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
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "user")
        }
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: "history")
        }
    }
    
    func changeHairColor(to newColor: Color) {
        self.hairColor = newColor
        if let encoded = try? JSONEncoder().encode(hairColor) {
            UserDefaults.standard.set(encoded, forKey: "hairColor")
        }
    }
    
    func changeSkinColor(to newColor: Color) {
        self.skinColor = newColor
        if let encoded = try? JSONEncoder().encode(skinColor) {
            UserDefaults.standard.set(encoded, forKey: "skinColor")
        }
    }
    
    func changeUserName(to newUserName: String) {
        self.isFirstLogin = false
        self.user.character.name = newUserName
        
        if let encoded = try? JSONEncoder().encode(isFirstLogin) {
            UserDefaults.standard.set(encoded, forKey: "isFirstLogin")
        }
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "user")
        }
    }
    
    func addTask(task: TaskModel) {
        if(user.tasks.filter {TaskModel.hasSameInfo(lhs: $0, rhs: task)}.isEmpty) {
            self.user.tasks.append(task)
        }
        save()
    }
    
    func editTask(oldTask: TaskModel, newTask: TaskModel) {
        let index = user.tasks.firstIndex(of: oldTask)!
        user.tasks[index] = newTask
        save()
    }
    
    func deleteTask(task: TaskModel) {
        self.user.tasks.remove(at: self.user.tasks.firstIndex {$0 == task}!)
        save()
    }
    
    func equipItem(_ item: ItemModel) {
        if let equipedItem = user.character.inventory.equipedItems.filter({ $0.type == item.type }).first {
            user.character.inventory.equipedItems.remove(at: user.character.inventory.equipedItems.firstIndex(of: equipedItem)!)
        }
        user.character.inventory.equipedItems.append(item)
        save()
    }
    
    func unequipItem(_ item: ItemModel) {
        user.character.inventory.equipedItems.remove(at: user.character.inventory.equipedItems.firstIndex(of: item)!)
        save()
    }
    
    func changeCompletenessState(of task: TaskModel) {
        let taskIndex = user.tasks.firstIndex(of: task)
        
        user.tasks[taskIndex!].isComplete.toggle()
        if (user.tasks[taskIndex!].isComplete) {
            user.character.receiveExperience(amount: 10 * max(1,user.streak))
        }
        if (user.tasks.allSatisfy {$0.isComplete}) {
            user.streak += 1
        }
    }
    
    static func emptyState() -> UserManager {
        let manager = UserManager()
        
        let inventory = InventoryModel(items: [], equipedItems: [])
        let bestiary = BestiaryModel(monsterCollection: [:])
        let character = CharacterModel(name: "", level: 0, experience: 0, money: 0, inventory: inventory, bestiary: bestiary)
        
        manager.user = UserModel(character: character, tasks: [], streak: 0)
        manager.history = HistoryModel(history: [:])
        manager.isFirstLogin = true
        
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
                    ItemModel(name: "coroa", type: .hat, price: 10, amount: 1),
                    ItemModel(name: "toga", type: .top, price: 10, amount: 1),
                    ItemModel(name: "pocao1", type: .powerUp, price: 10, amount: 1),
                    ItemModel(name: "pocao2", type: .powerUp, price: 10, amount: 5),
                    ItemModel(name: "pocao3", type: .powerUp, price: 10)
                ],
                equipedItems: [ItemModel(name: "coroa", type: .hat, price: 10, amount: 1)]
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
        manager.isFirstLogin = false
        
        return manager
    }
}
