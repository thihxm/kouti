//
//  TasksDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct TasksDisplay: View {
    @ObservedObject var userManager: UserManager
    @State var selectedCategories: Set<Category> = Set<Category>()
    var selectedTasks: [TaskModel] {
        userManager.user.tasks.filter{ (selectedCategories.contains($0.tag) || selectedCategories.isEmpty) }.sorted(by: <)
    }
    
    
    func buildButton(for task: TaskModel) -> some View {
        print("Construindo botão")
        let index = userManager.user.tasks.firstIndex {$0 == task}
        print("Indice \(String(describing: index))")
        return ZStack {
            NavigationLink(destination: EditMissionView(task: selectedTasks[index!], isNewMission: false)) {
                EmptyView()
            }.opacity(0.0)
            .buttonStyle(PlainButtonStyle())

            TaskButton(task: $userManager.user.tasks[index!])
                
        }.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
    
    func deletar(_ indexSet: IndexSet) {
        print("Buscando tarefa")
        let task = selectedTasks[indexSet.first!]
        print("Tarefa encontrada: \(task.name)")
        userManager.deleteTask(task: task)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Meus hábitos")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                Spacer()
                NavigationLink(
                    destination: NewMissionView(tasks: DefaultTasks.tasks),
                    label: {
                    Image(systemName: "plus.app.fill")
                        .accentColor(Color("grayAddButton"))
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        .frame(width: 20, height: 20, alignment: .center)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                })
                .shadow(color: .black.opacity(0.25), radius: 3, x: 0.0, y: 1)
            }
            TagSelector($selectedCategories)
                List {
                    ForEach(selectedTasks) { task in
                        let index = userManager.user.tasks.firstIndex {$0 == task}
                        ZStack {
                            NavigationLink(destination: EditMissionView(task: userManager.user.tasks[index!], isNewMission: false)) {
                                EmptyView()
                            }.opacity(0.0)
                            .buttonStyle(PlainButtonStyle())

                            TaskButton(task: $userManager.user.tasks[index!])
                                
                        }.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    .onDelete(perform: { indexSet in
                        deletar(indexSet)
                    })
                }.animation(.easeInOut)
                .listStyle(PlainListStyle())
        }.padding(.top, 25)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}
