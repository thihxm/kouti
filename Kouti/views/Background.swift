//
//  Background.swift
//  Kouti
//
//  Created by Thiago Medeiros on 30/06/21.
//

import SwiftUI

fileprivate struct RectangleCut: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: -0.14667*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.47867*width, y: 0.12143*height), control1: CGPoint(x: -0.14667*width, y: 0), control2: CGPoint(x: 0.10877*width, y: 0.12143*height))
        path.addCurve(to: CGPoint(x: 1.104*width, y: 0), control1: CGPoint(x: 0.84856*width, y: 0.12143*height), control2: CGPoint(x: 1.104*width, y: 0))
        path.addLine(to: CGPoint(x: 1.104*width, y: 1.34642*height))
        path.addLine(to: CGPoint(x: -0.14667*width, y: 1.34642*height))
        path.addLine(to: CGPoint(x: -0.14667*width, y: 0))
        path.closeSubpath()
        return path
    }
}

struct Background: View {
    var color: Color = Color("purpleGuide")
    var imageOffset: CGSize = CGSize(width: -80, height: -12)
    var rectOffset: CGSize = CGSize(width: 0, height: 226)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("bgTexture")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .opacity(0.3)
                    .background(color)
                    .offset(imageOffset)
                    
                RectangleCut()
                    .fill(Color("light2"))
                    .offset(x: -70 + rectOffset.width, y:  rectOffset.height)
                    .clipped()
                    
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
