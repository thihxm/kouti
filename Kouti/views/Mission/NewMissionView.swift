//
//  NewMissionView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 22/06/21.
//

import SwiftUI

struct NewMissionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var tasks: [TaskModel]
    @State var selectedCategory: Category = .health
    
    let columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
    
    func taskLabel(_ task: TaskModel) -> some View {
        var taskModel = task
        taskModel.monster = MonsterModel(name: String(Int.random(in: 1...4)), titles: [])
        
        return NavigationLink(destination: EditMissionView(task: taskModel, isNewMission: true)) {
            DefaultMissionLink(sticker: task.name.lowercased(), label: task.name)
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 18) {
                BackButton()
                    .padding(.leading, -8)
                    .padding(.top, -5)
                
                NavigationLink(destination: EditMissionView(isNewMission: true)) {
                    Text("Criar missão personalizada")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, 11)

                    Spacer()

                    Image(systemName: "plus")
                        .foregroundColor(Color("purpleGuide"))
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .imageScale(.medium)
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(10)
                .background(Color("purpleGuide"))
                .cornerRadius(30)
                
                Divider()
                
                HStack {
                    Text("Escolher missão pronta: \(Text(selectedCategory.rawValue).fontWeight(.black))")
                        .font(.headline)
                        .foregroundColor(Color("purpleGuide"))

                    Spacer()
                }
                
                VStack(spacing: 25) {
//                    TagList($selectedCategory)
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 22) {
                            ForEach(
                                tasks.filter {selectedCategory == $0.tag},
                                id: \.self.name
                            ) { task in
                                taskLabel(task)
                            }
                        }.padding(.top, 8)
                    }
                }
                .background(Color.white)
            }
            .padding([.top, .leading, .trailing])
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
            // Não é o ideal, mas não consegui fazer com que as bordas do circulo fossem cortadas sem usar o GeometryReader
            CategoryRoulette(selectedCategory: $selectedCategory)
        }
    }
}

struct NewMissionView_Previews: PreviewProvider {
    static var previews: some View {
        NewMissionView(tasks: DefaultTasks.tasks)
    }
}
