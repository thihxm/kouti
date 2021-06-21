//
//  DaysSelector.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct DaysSelector: View {
    @State private var selectedDays = [Bool](repeating: false, count: Days.allCases.count)
    
    func selectDay(_ index: Int) -> () -> () {
        return { selectedDays[index].toggle() }
    }
    
    func getBackgroundColor(_ index: Int) -> Color {
        if selectedDays[index] {
            return Color("bgSelectedItem")
        }
        return Color("grayCheckboxButtons")
    }
    
    func getShadow(_ index: Int) -> Color {
        if selectedDays[index] {
            return .black.opacity(0.25)
        }
        return .clear
    }
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(selectedDays.indices) { index in
                VStack(alignment: .center) {
                    Button(action: selectDay(index)) {
                        Text(Days.allCases[index].getDescription().prefix(1))
                            .font(.callout)
                            .foregroundColor(.white)
                            .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    }
                }
                .frame(width: 24, height: 24, alignment: .center)
                .background(getBackgroundColor(index))
                .cornerRadius(50)
                .shadow(color: getShadow(index), radius: 4, x: 0.0, y: 4)
                .animation(.easeInOut(duration: 0.05))
            }
        }
    }
}

struct DaysSelector_Previews: PreviewProvider {
    static var previews: some View {
        DaysSelector()
    }
}
