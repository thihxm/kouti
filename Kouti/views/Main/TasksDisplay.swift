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
        ZStack(alignment: .topTrailing) {
            NavigationLink(
                destination: NewMissionView(tasks: DefaultTasks.tasks),
                label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .imageScale(.medium)
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(Color("purpleGuide"))
                        .clipShape(Circle())
                }
            )
            .shadow(color: .black.opacity(0.25), radius: 3, x: 0.0, y: 1)
            .offset(x: 5, y: -10)
            .zIndex(100)
            
            VStack(alignment: .leading) {
                TagSelector($selectedCategories)
                ScrollView {
                    LazyVStack.init(spacing: 15) {
                        ForEach(selectedTasks) { task in
                            let binding = Binding(
                                get: { task },
                                set: { $0 }
                            )
                            ZStack {
                                TaskButton(task: binding)
                                    .addButtonActions(task: task, leadingButtons: [],
                                                      trailingButton:  [.edit,.delete], onClick: { button in
                                                        print("clicked: \(button)")
                                                      })
                                    .onTapGesture {
                                        userManager.changeCompletenessState(of: task)
                                    }
                            }
                        }
                    }
                }.animation(.easeIn)
            }.padding(.top, 25)
            .padding(.bottom, 8)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
        }
    }
}
