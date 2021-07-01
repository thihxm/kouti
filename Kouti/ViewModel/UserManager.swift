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

    var lastLogin: Date
    var doubleMoneyLastUse: Date = Calendar.current.date(from: DateComponents(year: 1))!
    var freezeStreakLastUse: Date = Calendar.current.date(from: DateComponents(year: 1))!
    var increaseBaseMoneyUsages: Int = 0
    var today: Date {
        let calendar = Calendar.current
        let today = calendar.dateComponents([.day, .month, .year], from: Date())
        return calendar.date(from: DateComponents(year: today.year, month: today.month, day: today.day, hour: 0, minute: 0, second: 0, nanosecond: 0))!
    }
    var todayTasks: [TaskModel] {
        return user.getMissionsFor(today)
    }
    
    required init() {
        let inventory = InventoryModel.halfInventory()
        let bestiary = BestiaryModel.halfInventory()
        let character = CharacterModel(name: "Camaradinha", level: 1, experience: 0, money: 0, inventory: inventory, bestiary: bestiary)
        self.user = UserModel(character: character, tasks: [], streak: 0)
        self.history = HistoryModel(history: [:])
        self.skinColor = .white
        self.hairColor = .white
        self.isFirstLogin = true
        
        let calendar = Calendar.current
        let today = calendar.dateComponents([.day, .month, .year], from: Date())
        self.lastLogin = calendar.date(from: DateComponents(year: today.year, month: today.month, day: today.day, hour: 0, minute: 0, second: 0, nanosecond: 0))!

        if let data = UserDefaults.standard.data(forKey: "user") {
            if let decoded = try? JSONDecoder().decode(UserModel.self, from: data) {
                self.user = decoded
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
        
        if let data = UserDefaults.standard.data(forKey: "lastLogin") {
            if let decoded = try? JSONDecoder().decode(Date.self, from: data) {
                self.lastLogin = decoded
            }
        }
        
        if let data = UserDefaults.standard.data(forKey: "doubleMoney") {
            if let decoded = try? JSONDecoder().decode(Date.self, from: data) {
                self.doubleMoneyLastUse = decoded
            }
        }

        if let data = UserDefaults.standard.data(forKey: "freeze") {
            if let decoded = try? JSONDecoder().decode(Date.self, from: data) {
                self.freezeStreakLastUse = decoded
            }
        }
        
        if let data = UserDefaults.standard.data(forKey: "increaseMoney") {
            if let decoded = try? JSONDecoder().decode(Int.self, from: data) {
                self.increaseBaseMoneyUsages = decoded
            }
        }
    }
    
    func updateHistory() {
        print("Updating history")
        print("History: \(history)")
        print("Last login was \(lastLogin). Today is \(today)")
        if (today == lastLogin) {
            return
        }
        
        for task in self.user.tasks {
            if task.isComplete {
                self.user.tasks[self.user.tasks.firstIndex(of: task)!].isComplete = false
            } else {
                if (freezeStreakLastUse.distance(to: today) > 86400 && user.getMissionsFor(lastLogin).contains(task)) {
                    self.user.streak = 0
                }
            }
        }
        
        print(lastLogin.distance(to: today))
        if (lastLogin.distance(to: today) > 86400) {
            self.user.streak = 0
        }

        lastLogin = today
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "user")
        }
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: "history")
        }
        if let encoded = try? JSONEncoder().encode(lastLogin) {
            UserDefaults.standard.set(encoded, forKey: "lastLogin")
        }
        if let encoded = try? JSONEncoder().encode(increaseBaseMoneyUsages) {
            UserDefaults.standard.set(encoded, forKey: "increaseMoney")
        }
        if let encoded = try? JSONEncoder().encode(doubleMoneyLastUse) {
            UserDefaults.standard.set(encoded, forKey: "doubleMoney")
        }
        if let encoded = try? JSONEncoder().encode(freezeStreakLastUse) {
            UserDefaults.standard.set(encoded, forKey: "freeze")
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
        print(task)
        print("monster#\(String(describing: task.monster.name))")
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
        print("indice da tarefa \(self.user.tasks.firstIndex {$0 == task}!)")
        print("total de tarefas \(self.user.tasks.count)")
        self.user.tasks.remove(at: self.user.tasks.firstIndex {$0 == task}!)
        print("tarefa apagada, novo total de tarefas: \(self.user.tasks.count)")
        save()
    }
    
    func equipItem(_ item: ItemModel) {
        if let equipedItem = user.character.inventory.equipedItems.filter({ $0.type == item.type }).first {
            user.character.inventory.equipedItems.remove(at: user.character.inventory.equipedItems.firstIndex(of: equipedItem)!)
        }
        user.character.inventory.equipedItems.append(item)
        save()
    }
    
    func usePowerUp(_ powerUp: ItemModel) {
        switch powerUp.name {
        case "pocao1":
            increaseBaseMoneyUsages += 1
        case "pocao2":
            doubleMoneyLastUse = today
        case "pocao3":
            freezeStreakLastUse = today
        default:
            print("\(powerUp.name) not found" )
        }
        
        let index = user.character.inventory.items.firstIndex(of: powerUp)!
        user.character.inventory.items[index].amount -= 1
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
            if (!(self.history.history[today]?.contains(task) ?? false) && todayTasks.contains(task)) {
                user.character.receiveExperience(amount: 10 * max(1,user.streak))
                user.character.money += (10 + increaseBaseMoneyUsages) * (doubleMoneyLastUse.distance(to: today) > 86400 * 7 ? 1 : 2)
                
                if let _ = self.history.history[today] {
                    self.history.history[today]?.append(task)
                } else {
                    self.history.history[today] = [task]
                }
                
                if (todayTasks.allSatisfy {$0.isComplete}) {
                    user.streak += 1
                }
            }
        }
        
        save()
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
                monsterCollection: [MonsterModel(name: "1", titles: []) : 1,
                                    MonsterModel(name: "2", titles: []) : 0,
                                    MonsterModel(name: "3", titles: []) : 3,
                                    MonsterModel(name: "4", titles: []) : 0]
            )
        )
        let tasks = [
            TaskModel(
                name: "Beber água",
                tag: .health,
                frequency:Set([.monday,.friday,.saturday,.sunday,.wednesday]),
                notifications: [],
                monster:MonsterModel(name: "1", titles: []), isComplete: true
            ),
            TaskModel(
                name: "Ler Harry Potter",
                tag: .entertainment,
                frequency:Set([.monday,.tuesday]),
                notifications: [],
                monster: MonsterModel(name: "1", titles: []), isComplete: true
            ),
            TaskModel(
                name: "Guardar dinheiro",
                tag: .financial,
                frequency:Set([.friday]),
                notifications: [],
                monster: MonsterModel(name: "2", titles: []), isComplete: true
            ),
            TaskModel(
                name: "Meditar",
                tag: .health,
                frequency:Set([.monday,.tuesday,.friday,.saturday,.sunday,.thursday,.wednesday]),
                notifications: [],
                monster: MonsterModel(name: "2", titles: []), isComplete: true
            ),
            TaskModel(
                name: "Estudar",
                tag: .learning,
                frequency:Set([.monday,.friday,.wednesday]),
                notifications: [],
                monster: MonsterModel(name: "3", titles: []), isComplete: true
            ),
            TaskModel(
                name: "Entregar relatório",
                tag: .work,
                frequency:Set([.thursday]),
                notifications: [],
                monster: MonsterModel(name: "4", titles: []), isComplete: true
            )
        ]
        
        manager.user = UserModel(character: character, tasks: tasks, streak: 17)
        manager.history = HistoryModel(history: [:])
        manager.isFirstLogin = false
        
        return manager
    }
}
