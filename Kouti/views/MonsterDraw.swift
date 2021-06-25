//
//  MonsterDraw.swift
//  Kouti
//
//  Created by Thiago Medeiros on 24/06/21.
//

import SwiftUI

struct MonsterDraw: View {
    @State var spinX = false
    let rotation = 720.0
    
    var body: some View {
        Text("?")
            .font(.system(size: 144, weight: .bold, design: .rounded))
            .foregroundColor(Color("dark3"))
            .background(
                Circle()
                    .fill(Color("grayAddButton"))
                    .frame(width: 190, height: 190)
            )
            .rotation3DEffect(
                .degrees(spinX ? rotation : 1),
                axis: (x: 0, y: spinX ? 1 : 0, z: 0)
            )
            .animation(Animation.linear(duration: 1))
            .rotation3DEffect(
                .degrees(spinX ? rotation : 1),
                axis: (x: 0, y: spinX ? 1 : 0, z: 0)
            )
            .animation(Animation.linear(duration: 0.8).delay(1))
            .rotation3DEffect(
                .degrees(spinX ? rotation : 1),
                axis: (x: 0, y: spinX ? 1 : 0, z: 0)
            )
            .animation(Animation.linear(duration: 0.6).delay(1.8))
            .rotation3DEffect(
                .degrees(spinX ? rotation : 1),
                axis: (x: 0, y: spinX ? 1 : 0, z: 0)
            )
            .animation(Animation.linear(duration: 0.4).delay(2.4))
            .rotation3DEffect(
                .degrees(spinX ? rotation : 1),
                axis: (x: 0, y: spinX ? 1 : 0, z: 0)
            )
            .animation(Animation.linear(duration: 0.4).repeatForever(autoreverses: false).delay(2.8))
            .onAppear() {
                spinX.toggle()
            }
    }
}

struct MonsterDraw_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDraw()
    }
}
