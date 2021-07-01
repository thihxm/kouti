//
//  FullGraph.swift
//  Kouti
//
//  Created by Marco Zulian on 28/06/21.
//

import SwiftUI

struct Statistics: View {
    @EnvironmentObject var userManager: UserManager

    public var body: some View {
        VStack (alignment: .center) {
            Text("Estatísticas")
                .font(.system(size: 15, weight: .semibold, design: .default))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            HStack (alignment: .center, spacing: 20){
                VStack(alignment: .center)
                {
                    GeometryReader { geometry in
                        Graph(geometry: geometry)
                    }
                    Text("Progresso").font(.headline)
                    Text("DIÁRIO").font(.caption2)
                }

                VStack {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, category: .health, half: false)
                    }.frame(width: 50, height: 50, alignment: .center)
                    Text("Saúde").font(.caption2)
                }
                    
                VStack {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, category: .financial, half: false)
                    }.frame(width: 50, height: 50, alignment: .center)
                    Text("Financeiro").font(.caption2)
                }
                   
                VStack {
                    GeometryReader { geometry in
                        Graph(geometry: geometry, category: .learning, half: false)
                    }.frame(width: 50, height: 50, alignment: .center)
                    Text("Aprendizado").font(.caption2)
                }
            }
        }.frame(maxHeight:125)
        .padding()
        .background(RoundedRectangle(cornerRadius: 30).foregroundColor(.white))
        .shadow(radius: 10)
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
            .environmentObject(UserManager.fullState())
    }
}
