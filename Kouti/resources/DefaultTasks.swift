//
//  DefaultTasks.swift
//  Kouti
//
//  Created by Marco Zulian on 24/06/21.
//

import Foundation

struct DefaultTasks {
    static let tasks: [TaskModel] =
        [TaskModel(name: "Tomar água", tag: .health, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Correr", tag: .health, frequency: [.monday,.wednesday,.friday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Musculação", tag: .health, frequency: [.tuesday,.thursday,.saturday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Usar menos o celular", tag: .health, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Yoga", tag: .health, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Dormir cedo", tag: .health, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Meditação", tag: .health, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Ler", tag: .entertainment, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Desenhar", tag: .entertainment, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Jogar", tag: .entertainment, frequency: [.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Estudar", tag: .learning, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Journaling", tag: .learning, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Fazer pequenas pausas", tag: .work, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Listar tarefas", tag: .work, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Guardar dinheiro", tag: .financial, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Checar investimentos", tag: .financial, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday], monster: MonsterModel(name: "undef", titles: [])),
         TaskModel(name: "Conferir gastos", tag: .financial, frequency: [.monday,.tuesday,.wednesday,.thursday,.friday,.saturday,.sunday], monster: MonsterModel(name: "undef", titles: [])),]
}
