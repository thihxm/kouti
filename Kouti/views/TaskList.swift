//
//  TaskList.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct TaskList: View {
    @State var tasks: [TaskModel]
    
    var body: some View {
        ScrollView {
            ForEach(tasks, id: \.self.name) { task in
                TaskButton(task: task)
            }
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList(tasks:
            [TaskModel(
                name: "Beber água",
                tag: .health,
                frequency:Set([.monday,.friday,.saturday,.sunday,.wednesday]),
                notifications: [],
                monster:
                    MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
             TaskModel(
                 name: "Ler Harry Potter",
                tag: .entertainment,
                frequency:Set([.monday,.tuesday]),
                 notifications: [],
                 monster:
                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
             TaskModel(
                 name: "Guardar dinheiro",
                 tag: .financial,
                 frequency:Set([.friday]),
                 notifications: [],
                 monster:
                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
             TaskModel(
                 name: "Meditar",
                 tag: .health,
                frequency:Set([.monday,.tuesday,.friday,.saturday,.sunday,.thursday,.wednesday]),
                 notifications: [],
                 monster:
                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
             TaskModel(
                 name: "Estudar",
                tag: .learning,
                frequency:Set([.monday,.friday,.wednesday]),
                 notifications: [],
                 monster:
                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
             TaskModel(
                 name: "Entregar relatório",
                tag: .work,
                frequency:Set([.thursday]),
                 notifications: [],
                 monster:
                     MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true)
            ]
        )
    }
}
