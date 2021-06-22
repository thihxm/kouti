//
//  TaskButton.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct TaskButton: View {
    @State var task: TaskModel
    
    // TODO: Alguma modificação na aparência quando estiver completo?
    // TODO: Comportamento de slide para abrir opções. Quais são os comportamentos que devem ser incluidos?
    var body: some View {
        Button(action: {task.isComplete.toggle()})
        {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .offset(y: bottomRectangleOffset)
                    .foregroundColor(task.tag.getColor())
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(Color("grayBgButtons"))
                HStack (alignment: .center) {
                    VStack (alignment: .leading, spacing: 10) {
                        Text(task.name)
                            .font(.system(size: 17, weight: .bold, design: .default))
                        Text(task.frequencyDescription())
                            .font(.footnote)
                    }
                    Spacer()
                    makeCompleteButton()
                }.padding()
            }.frame(maxHeight: 68)
        }.foregroundColor(.black)
        .animation(.easeOut)
        .padding(.vertical)
    }
    
    @ViewBuilder
    private func makeCompleteButton() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 26, height: 26)
                .foregroundColor(Color("grayCheckboxButtons"))
            if (task.isComplete) {
                Image(systemName: "checkmark")
                    .foregroundColor(Color("bg4"))
                    .font(.system(size: 22, weight: .bold, design: .default))
            }
        }
    }
    
    
    // MARK: drawing constants
    let cornerRadius: CGFloat = 16.0
    let bottomRectangleOffset: CGFloat = 5
    
}


struct TaskButton_Previews: PreviewProvider {
    static var previews: some View {
        TaskButton(task: TaskModel(name: "Beber água", tag: .health, frequency: Set([.monday,.friday,.saturday,.sunday,.wednesday]), notifications: [], monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true))
    }
}
