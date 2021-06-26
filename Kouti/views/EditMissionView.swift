//
//  NewHabitView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct EditMissionView: View {
    @EnvironmentObject var userManager: UserManager
    var task: TaskModel?
    @State var allowNotification: Bool = false
    @State var missionTitle: String = ""
    @State var alertsTime: [Date] = []
    @State var selectedCategory: Category? = nil
    @State private var selectedDays: Set<Days> = []
    var isNewMission: Bool = false
    @State var shouldGoToMainScreen: Bool = false
    
    init(isNewMission: Bool) {
        self.allowNotification = false
        self.missionTitle = ""
        self.alertsTime = []
        self.selectedCategory = nil
        self.selectedDays = []
        self.isNewMission = isNewMission
    }
    
    init(task: TaskModel, isNewMission: Bool) {
        self.task = task
        
        self._allowNotification = State(initialValue: !task.notifications.isEmpty)
        self._missionTitle = State(initialValue: task.name)
        self._alertsTime = State(initialValue: task.notifications.map {
            let calendar = Calendar.current
            return calendar.date(from: $0)!
        })
        self._selectedCategory = State(initialValue: task.tag)
        self._selectedDays = State(initialValue: task.frequency)
        self.isNewMission = isNewMission
    }
    
    func addAlert() {
        alertsTime.append(Date())
    }
    
    // TODO: Generate a random monster or get current task Monster
    func saveTask() {
        let notifications: [DateComponents] = Array(Set(alertsTime.map {date in
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minute = calendar.component(.minute, from: date)

            return DateComponents(hour: hour, minute: minute)
        }))

        let newTask = TaskModel(
            name: missionTitle,
            tag: selectedCategory!,
            frequency: selectedDays,
            notifications: notifications,
            monster: MonsterModel(name: "", category: .health, titles: []),
            isComplete: false
        )
        
        if isNewMission {
            userManager.addTask(task: newTask)
        } else {
            userManager.editTask(oldTask: self.task!, newTask: newTask)
        }
        
        shouldGoToMainScreen = true
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack(spacing: 25) {
                VStack(spacing: 8) {
                    Image("Monster")
                        .resizable()
                        .scaledToFit()
                    
                    TextField("Escreva sua missão", text: $missionTitle)
                        .font(.callout)
                        .foregroundColor(Color("bg4"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color("light3"))
                        .cornerRadius(40)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 0.0, y: 4)
                        .frame(maxWidth: 255)
                }
                
                VStack {
                    ScrollView {
                        TagList($selectedCategory)
                            .padding(.bottom, 17)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Dias da semana")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.bottom, 15)
                            DaysSelector($selectedDays)
                                .padding(.bottom, 20)
                            
                            
                            Toggle(isOn: $allowNotification) {
                                Text("Notificações")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: Color("bgSelectedItem")))
                            .padding(.bottom, 30)
                            
                            
                            if allowNotification {
                                VStack {
                                    VStack(spacing: 0) {
                                        ForEach(alertsTime, id:\.self) { alertTime in
                                            NotificationTimePicker("Alerta \(alertsTime.firstIndex(of: alertTime)! + 1)", alertTime: State(initialValue: alertTime))
                                        }
                                    }
                                    Spacer()
                                    Button(action: addAlert) {
                                        Spacer()
                                        Text("Adicionar alerta")
                                        Spacer()
                                    }
                                    .padding(.bottom, 25)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 9)
                    .padding(.bottom, 110)
                }
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(18)
                .padding(.horizontal, 24)
            }
            .background(Color("bgOptional").edgesIgnoringSafeArea(.all))
            
            NavigationLink(destination: MainPageView(userManager: userManager), isActive: $shouldGoToMainScreen) {
                Text("Salvar")
                    .font(.callout)
                    .foregroundColor(Color("dark3"))
                    .padding(.horizontal, 61)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(30)
                    .offset(y: -18)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0.0, y: 4)
                    .onTapGesture(perform: saveTask)
            }
        }
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        EditMissionView(isNewMission: true)
            .previewDisplayName("Vazio")
            .environment(\.locale, .init(identifier: "br"))
        EditMissionView(
            task: TaskModel(
            name: "Tomar água",
            tag: .health,
            frequency: [.monday, .tuesday, .wednesday, .friday],
            notifications: [DateComponents(hour: 10, minute: 30), DateComponents(hour: 23, minute: 19)],
            monster: MonsterModel(name: "", category: .health, titles: []),
            isComplete: false
        ),
            isNewMission: true)
        .previewDisplayName("Passando Task")
        .environment(\.locale, .init(identifier: "br"))
    }
}
