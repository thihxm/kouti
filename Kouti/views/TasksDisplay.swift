//
//  TasksDisplay.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct TasksDisplay: View {
    @Binding var tasks: [TaskModel]
    @State var selectedCategories: Set<Category> = Set<Category>()
    var selectedTasks: [TaskModel] {
        tasks.filter{ selectedCategories.contains($0.tag) || selectedCategories.isEmpty }
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
            ScrollView {
                ForEach(selectedTasks, id: \.self.name) { task in
                    let index = tasks.firstIndex {$0.name == task.name}
                    TaskButton(task: $tasks[index!])
                }.animation(.easeInOut)
            }
        }.padding(.top, 25)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(16)
    }
}
