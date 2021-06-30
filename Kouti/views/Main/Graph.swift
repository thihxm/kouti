//
//  Graph.swift
//  Kouti
//
//  Created by Marco Zulian on 28/06/21.
//

import SwiftUI

public struct Graph: View {
    var geometry: GeometryProxy
    @State var percentage: Int
    var half: Bool = true
    
    var backPath: Path {
        let chartSize = half ? geometry.size.width / 2 : geometry.size.width
        let radius = half ? chartSize : chartSize / 2
        let centerX = radius
        let centerY = radius
        
        var path = Path()
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: radius,
                    startAngle: Angle(degrees: half ? -180 : -90),
                    endAngle: Angle(degrees: half ? 0 : -451),
                    clockwise: false)
        return path
    }
    
    var frontPath: Path {
        let chartSize = half ? geometry.size.width / 2 : geometry.size.width
        let radius = half ? chartSize : chartSize / 2
        let centerX = radius
        let centerY = radius
        
        var path = Path()
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: radius,
                    startAngle: Angle(degrees: half ? -180 : -90),
                    endAngle: Angle(degrees: half ? -180 * (1 - Double(percentage) / 100) : -90 + 360 * (Double(percentage) / 100)),
                    clockwise: false)
        return path
    }
    
    public var body: some View {
        ZStack {
            backPath.stroke(Color("graphBack"), style: StrokeStyle(lineWidth: 3, lineCap: .round))
            frontPath.stroke(Color("graphFront"), style: StrokeStyle(lineWidth: 3, lineCap: .round))
            Text("\(percentage)%").font(.system(size: 12, weight: .semibold, design: .default))
        }
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Graph(geometry: geometry, percentage: 90, half: false)
        }
    }
}
