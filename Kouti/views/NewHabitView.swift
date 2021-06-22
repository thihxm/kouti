//
//  NewHabitView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct NewHabitView: View {
    @State var allowNotification: Bool = false
    @State var missionTitle: String = ""
    @State var alertsTime: [Date] = []
    @State var selectedCategory: Category? = nil
    @State private var selectedDays: Set<Days> = []
    
    init(selectedCategory: Category? = nil) {
        self._selectedCategory = State(initialValue: selectedCategory)
    }
    
    func addAlert() {
        alertsTime.append(Date())
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
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .cornerRadius(18)
                .padding(.horizontal, 24)
            }
            .background(Color("bgOptional").edgesIgnoringSafeArea(.all))
            
            Button(action: {}) {
                Text("Salvar")
                    .font(.callout)
                    .foregroundColor(Color("dark3"))
                    .padding(.horizontal, 61)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(30)
            }
            .offset(y: -18)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0.0, y: 4)

        }
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView()
            .environment(\.locale, .init(identifier: "br"))
    }
}
