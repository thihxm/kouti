//
//  TasksDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct TasksDisplay: View {
    @State var tasks: [TaskModel]
    @State var selectedCategories: Set<Category>
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Meus hábitos")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "plus.app.fill")
                        .accentColor(Color("grayCheckboxButtons"))
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        .frame(width: 20, height: 20, alignment: .center)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                })
                .shadow(color: .black.opacity(0.25), radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
            }
            TagSelector($selectedCategories)
            ScrollView {
                ForEach(tasks.filter {selectedCategories.contains($0.tag) || selectedCategories.isEmpty}, id: \.self.name) { task in
                    TaskButton(task: task)
                }.animation(.easeInOut)
            }
        }.padding()
    }
}


struct TasksDisplay_Previews: PreviewProvider {
    static var previews: some View {
        TasksDisplay(tasks:
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
            ], selectedCategories: Set<Category>()
        )
    }
}

