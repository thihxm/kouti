//
//  SwipeCategories.swift
//  Kouti
//
//  Created by Thiago Medeiros on 02/07/21.
//

import SwiftUI

fileprivate struct CircleDividers: Shape {
    var sections : Int
    var lineLengthPercentage: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let radius = rect.width / 2
        let degreeSeparation : Double = 360.0 / Double(sections)
        var path = Path()
        for index in 0..<Int(360.0/degreeSeparation) {
            let degrees = Double(index) * degreeSeparation
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let innerX = center.x + (radius - rect.size.width * lineLengthPercentage / 2) * CGFloat(cos(degrees / 360 * Double.pi * 2))
            let innerY = center.y + (radius - rect.size.width * lineLengthPercentage / 2) * CGFloat(sin(degrees / 360 * Double.pi * 2))
            let outerX = center.x + radius * CGFloat(cos(degrees / 360 * Double.pi * 2))
            let outerY = center.y + radius * CGFloat(sin(degrees / 360 * Double.pi * 2))
            path.move(to: CGPoint(x: innerX, y: innerY))
            path.addLine(to: CGPoint(x: outerX, y: outerY))
        }
        return path
    }
}

struct CategoryRoulette: View {
    enum SwipeDirection: String {
        case right = "Right", left = "Left"
    }
    
    
    @State private var rotation: Angle = Angle(degrees: 0)
    @State private var lastLocationX: CGFloat = 0
    @State var dragDirection: SwipeDirection = .right
    @State var easeDuration: Double = 0
    @State var selectedCategoryIndex: Int = 0
    @State var dragEnded: Bool = true
    
    let arcAngle: Double = 360/10
    let angles: [Double] = Array(stride(from: 0, to: 360, by: 36))
    var showDividers = false
    var size: CGFloat = 435
    @Binding var selectedCategory: Category
    
    func getColor(_ i: Int) -> Color {
        if selectedCategoryIndex == i {
            return Color("yellowRedesign")
        }
        return Color("blueNotSelected")
    }
    
    var body: some View {
        VStack {
            Spacer()

            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    Image(systemName: "triangle.fill")
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(180))
                        .font(.system(size: 30, weight: .semibold, design: .default))
                        .offset(y: -6)
                        .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
                        .zIndex(100)
                    
                    VStack(spacing: 12) {
                        Text(selectedCategory.rawValue)
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)

                        HStack(spacing: 12) {
                            Image(systemName: "arrowtriangle.left.fill")
                            
                            Text("Gire")
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                            
                            Image(systemName: "arrowtriangle.right.fill")
                        }
                        .foregroundColor(Color("rouletteIndicators"))
                        .font(.footnote)
                    }
                    .offset(y: 85)
                    .zIndex(10)
                    
                    ZStack {
                        if showDividers {
                            CircleDividers(sections: 10, lineLengthPercentage: 0.1)
                                .stroke(Color("blueNotSelected"))
                        }
                        ForEach(Category.allCases.indices) { i in
                            Image(systemName: Category.allCases[i].getIconName())
                                .foregroundColor(getColor(i))
                                .offset(y: 50 - (geometry.size.height/2))
                                .rotationEffect(.degrees(arcAngle * Double(i)))
                        }
                        ForEach(Category.allCases.indices) { i in
                            Image(systemName: Category.allCases[i].getIconName())
                                .foregroundColor(getColor(5 + i))
                                .offset(y: 50 - (geometry.size.height/2))
                                .rotationEffect(.degrees(arcAngle * Double(5 + i)))
                        }
                    }
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color("purpleGuide"))
                    .clipShape(Circle())
                    .rotationEffect(rotation)
                    .animation(.easeOut(duration: 1 + easeDuration))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.dragEnded = false
                                let currentLocationX = gesture.location.x
                                let degrees: Angle = .degrees(3)
                                if abs(currentLocationX) > self.lastLocationX {
                                    self.rotation += degrees
                                    self.dragDirection = .right
                                } else {
                                    self.rotation -= degrees
                                    self.dragDirection = .left
                                }
                                self.lastLocationX = abs(currentLocationX)
                            }
                            .onEnded { gesture in
                                self.dragEnded = true
                                let angle = Double(gesture.predictedEndLocation.x - gesture.location.x)/2
                                self.easeDuration = Double(Int(abs(angle * 2)) % 10)/10
                                
                                let degrees: Angle = .degrees(abs(angle))
                                
                                if dragDirection == .right {
                                    self.rotation += degrees
                                } else {
                                    self.rotation -= degrees
                                }
                            }
                    )
                    .onChange(of: dragEnded, perform: { hasEnded in
                        if hasEnded {
                            let correctedAngle = rotation.degrees.truncatingRemainder(dividingBy: 360)
                            let closestAngle = angles.enumerated().min(by: { abs($0.1 - abs(correctedAngle)) < abs($1.1 - abs(correctedAngle))} )!.element
                            
                            let difference = correctedAngle < 0 ? correctedAngle + closestAngle : correctedAngle - closestAngle

                            self.rotation -= .degrees(difference)
                        }
                    })
                    .onChange(of: rotation, perform: { angle in
                        let correctedAngle = angle.degrees.truncatingRemainder(dividingBy: 360)
                        let categoryRange = abs(correctedAngle/36)

                        if categoryRange >= 9.5 || categoryRange < 0.5 {
                            self.selectedCategoryIndex = 0
                        } else if categoryRange >= 0.5 && categoryRange < 1.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 1 : 9
                        } else if categoryRange >= 1.5 && categoryRange < 2.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 2 : 8
                        } else if categoryRange >= 2.5 && categoryRange < 3.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 3 : 7
                        } else if categoryRange >= 3.5 && categoryRange < 4.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 4 : 6
                        } else if categoryRange >= 4.5 && categoryRange < 5.5 {
                            self.selectedCategoryIndex = 5
                        } else if categoryRange >= 5.5 && categoryRange < 6.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 6 : 4
                        } else if categoryRange >= 6.5 && categoryRange < 7.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 7 : 3
                        } else if categoryRange >= 7.5 && categoryRange < 8.5 {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 8 : 2
                        } else {
                            self.selectedCategoryIndex = correctedAngle < 0 ? 9 : 1
                        }
                    })
                    .onChange(of: selectedCategoryIndex, perform: { index in
                        self.selectedCategory = Category.allCases[index % 5]
                    })
                }
                .offset(y: 40 + geometry.size.height/2)
            }
            .frame(width: size, height: size)
        }
        .edgesIgnoringSafeArea(.bottom)
//        .aspectRatio(contentMode: .fit)
    }
}

struct SwipeCategories_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRoulette(selectedCategory: .constant(.entertainment))
    }
}
