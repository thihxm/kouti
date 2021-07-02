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
    var main: Bool
    var selectedTasks: [TaskModel] {
        main ? userManager.todayTasks.filter { (selectedCategories.contains($0.tag) || selectedCategories.isEmpty) && !$0.isComplete }.sorted(by: <) :
            userManager.user.tasks.filter { (!userManager.todayTasks.contains($0) || $0.isComplete) && (selectedCategories.contains($0.tag) || selectedCategories.isEmpty) }.sorted(by: >)
    }
    //    var selectedTasks: [TaskModel] {
    //        userManager.user.tasks.filter { (selectedCategories.contains($0.tag) || selectedCategories.isEmpty) }.sorted(by: <)
    //    }
    
    @ViewBuilder
    func buildEmptyMessage() -> some View {
        if userManager.todayTasks.isEmpty {
            Spacer()
            VStack(alignment: .center) {
                Text("Parece que você ainda não cadastrou nenhum hábito para hoje! Que tal fazer isso?").font(.headline).multilineTextAlignment(.center).padding(.leading)
            }
            Spacer()
        } else if userManager.todayTasks.allSatisfy({ $0.isComplete }) {
            Spacer()
            VStack(alignment: .center) {
                Text("Parabéns! Você concluiu todas as suas missões do dia!").font(.headline).multilineTextAlignment(.center).padding(.leading)
            }
            Spacer()
        } else {
            Spacer()
            VStack(alignment: .center) {
                Text("Nenhum hábito nesta categoria para hoje!").font(.headline).multilineTextAlignment(.center).padding(.leading)
            }
            Spacer()
        }
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                TagSelector($selectedCategories)
                if (main && selectedTasks.isEmpty) {
                    buildEmptyMessage()
                } else {
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
                }
            }.padding(.top, 25)
            .padding(.bottom, 8)
            .padding(.horizontal, 20)
    }
}
