//
//  FullGraph.swift
//  Kouti
//
//  Created by Marco Zulian on 28/06/21.
//

import SwiftUI

struct Statistics: View {
    @EnvironmentObject var userManager: UserManager
    
    var completedTasks: Int {
        userManager.user.tasks.filter { $0.isComplete }.count
    }
    var totalTasks: Int {
        max(1, userManager.user.tasks.count)
    }

    public var body: some View {
        VStack (alignment: .center) {
            Text("Estatísticas")
                .font(.system(size: 15, weight: .semibold, design: .default))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            HStack (alignment: .center, spacing: 20){
                VStack(alignment: .center)
                {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, percentage: completedTasks * 100 / totalTasks)
                    }
                    Text("Progresso").font(.headline)
                    Text("DIÁRIO").font(.caption2)
                }
                VStack {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, percentage: completedTasks * 100 / totalTasks, half: false)
                    }.frame(width: 50, height: 50, alignment: .center)
                    Text("Saúde").font(.caption2)
                }
                VStack {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, percentage: completedTasks * 100 / totalTasks, half: false)
                    }.frame(width: 50, height: 50, alignment: .center)
                    Text("Financeiro").font(.caption2)
                }
                VStack {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, percentage: completedTasks * 100 / totalTasks, half: false)
                    }.frame(width: 50, height: 50, alignment: .center)
                    Text("Trabalho").font(.caption2)
                }
            }
        }.frame(maxHeight:145)
        .padding()
        .background(RoundedRectangle(cornerRadius: 30).foregroundColor(.white))
        .shadow(radius: 10)
    }
}
