//
//  Graph.swift
//  Kouti
//
//  Created by Marco Zulian on 28/06/21.
//

import SwiftUI

public struct Graph: View {
    var geometry: GeometryProxy
    @EnvironmentObject var userManager: UserManager
    var category: Category?
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
        let percentage = getPercentage()
        
        var path = Path()
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: radius,
                    startAngle: Angle(degrees: half ? -180 : -90),
                    endAngle: Angle(degrees: half ? -180 * (1 - Double(percentage) / 100) : -90 + 360 * (Double(percentage) / 100)),
                    clockwise: false)
        return path
    }
    
    private func getPercentage() -> Int {
        if let category = self.category {
            return userManager.todayTasks.filter { $0.isComplete && $0.tag == category }.count * 100 / max(1, userManager.todayTasks.filter { $0.tag == category }.count)
        }
        
        return userManager.todayTasks.filter { $0.isComplete }.count * 100 / max(1, userManager.todayTasks.count)
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: half ? .bottom : .center)){
            backPath.stroke(Color("graphBack"), style: StrokeStyle(lineWidth: 3, lineCap: .round))
            frontPath.stroke(Color("graphFront"), style: StrokeStyle(lineWidth: 3, lineCap: .round)).animation(.linear)
            Text("\(getPercentage())%").font(.system(size: half ? 18 : 12, weight: .semibold, design: .default))
        }
    }
}

//struct Graph_Previews: PreviewProvider {
//    static var previews: some View {
//        GeometryReader { geometry in
//            Graph(geometry: geometry, percentage: 90, half: false)
//        }
//    }
//}
