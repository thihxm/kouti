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
        userManager.user.tasks.filter { (selectedCategories.contains($0.tag) || selectedCategories.isEmpty) }.sorted(by: <)
    }
//    var selectedTasks: [TaskModel] {
//        userManager.user.tasks.filter { (selectedCategories.contains($0.tag) || selectedCategories.isEmpty) }.sorted(by: <)
//    }
    
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
                LazyVStack.init(spacing: 15) {
                    ForEach(selectedTasks) { task in
                        Button(action: {userManager.changeCompletenessState(of: task)}, label: {
                            ZStack {
                                TaskButton(task: task)
                                    .addButtonActions(task: task, leadingButtons: [],
                                                      trailingButton:  [.edit,.delete], onClick: { button in
                                                        print("clicked: \(button)")
                                                      })
                            }
                        })
                    }
                }
            }.animation(.easeIn)
        }.padding(.top, 25)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}
