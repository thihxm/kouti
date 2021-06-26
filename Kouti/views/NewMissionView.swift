//
//  NewMissionView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 22/06/21.
//

import SwiftUI

struct NewMissionView: View {
    @State var tasks: [TaskModel]
    @State var selectedCategory: Category? = .health
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            NavigationLink(destination: EditMissionView(isNewMission: true)) {
                Text("Criar missão personalizada")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "plus.app.fill")
                    .accentColor(Color("grayAddButton"))
                    .font(.system(size: 23, weight: .semibold, design: .default))
                    .frame(width: 20, height: 20, alignment: .center)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .shadow(color: .black.opacity(0.25), radius: 3, x: 0.0, y: 1)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(22)
            
            VStack(spacing: 25) {
                TagList($selectedCategory)
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(
                            tasks.filter {selectedCategory == $0.tag},
                            id: \.self.name
                        ) { task in
                            NavigationLink(destination: EditMissionView(task: task, isNewMission: true)) {
                                DefaultMissionLink(sticker: task.name.lowercased(), label: task.name)
                            }
                        }
                    }
                    .padding(.horizontal, 5)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(22)
        }
        .padding()
        .background(Color("bgOptional").edgesIgnoringSafeArea(.all))
        .navigationTitle("Criar missões")
    }
}

struct NewMissionView_Previews: PreviewProvider {
    static var previews: some View {
        NewMissionView(
            tasks: [TaskModel(
                        name: "Beber água",
                        tag: .health,
                        frequency:[.monday,.friday,.saturday,.sunday,.wednesday],
                        monster:
                            MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                     TaskModel(
                         name: "Ler Harry Potter",
                        tag: .entertainment,
                        frequency:[.monday,.tuesday],
                         monster:
                             MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                     TaskModel(
                         name: "Guardar dinheiro",
                         tag: .financial,
                         frequency:[.friday],
                         monster:
                             MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                     TaskModel(
                         name: "Meditar",
                         tag: .health,
                        frequency:[.monday,.tuesday,.friday,.saturday,.sunday,.thursday,.wednesday],
                         monster:
                             MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                     TaskModel(
                         name: "Estudar",
                        tag: .learning,
                        frequency:[.monday,.friday,.wednesday],
                         monster:
                             MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true),
                     TaskModel(
                         name: "Entregar relatório",
                        tag: .work,
                        frequency:[.thursday],
                         monster:
                             MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true)
                    ]
        )
    }
}
