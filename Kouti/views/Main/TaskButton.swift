//
//  TaskButton.swift
//  Kouti
//
//  Created by Marco Zulian on 20/06/21.
//

import SwiftUI

struct TaskButton: View {
    @EnvironmentObject var userManager: UserManager
    @State var task: TaskModel
    
    // TODO: Alguma modificação na aparência quando estiver completo?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .offset(y: bottomRectangleOffset)
                .foregroundColor(task.tag.getColor())
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(Color("grayBgButtons"))
            HStack (alignment: .center) {
                Image("sticker#\(task.monster.name)_filled").resizable().scaledToFit()
                VStack (alignment: .leading, spacing: 5) {
                    Text(task.name)
                        .font(.system(size: 17, weight: .bold, design: .default))
                    Text(task.frequencyDescription())
                        .font(.footnote)
                }
                Spacer()
                makeCompleteButton()
            }.padding()
        }.frame(maxHeight: 68)
        .foregroundColor(.black)
        .animation(.easeInOut)
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
