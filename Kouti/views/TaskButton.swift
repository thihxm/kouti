//
//  TaskButton.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct TaskButton: View {
    @State var task: TaskModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .offset(y: bottomRectangleOffset)
                .foregroundColor(task.tag.getColor())
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(Color("grayBgButtons"))
            HStack (alignment: .center) {
                VStack (alignment: .leading, spacing: 10) {
                    Text(task.name).bold()
                    Text(task.frequencyDescription())
                }
                Spacer()
                Button(action: {task.isComplete.toggle()}, label: {
                    task.isComplete ?
                        Image(systemName: "checkmark.square") :
                        Image(systemName: "square")
                })
            }.padding()
        }.frame(maxHeight: 68)
        .padding()
        .onTapGesture {
            task.isComplete.toggle()
        }
    }
    
    // MARK: drawing constants
    let cornerRadius: CGFloat = 16.0
    let bottomRectangleOffset: CGFloat = 5
    
}


struct TaskButton_Previews: PreviewProvider {
    static var previews: some View {
        TaskButton(task: TaskModel(name: "Beber água", tag: .health, frequency: Set([.monday,.tuesday,.friday]), notifications: [], monster: MonsterModel(name: "Monstro1", category: .health, titles: []), isComplete: true))
    }
}
