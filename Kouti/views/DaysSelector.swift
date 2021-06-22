//
//  DaysSelector.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct DaysSelector: View {
    @Binding var selectedDays: Set<Days>
    
    init(_ selectedDays: Binding<Set<Days>>) {
        self._selectedDays = selectedDays
    }
    
    func selectDay(_ day: Days) -> () -> () {
        return {
            if selectedDays.contains(day) {
                selectedDays.remove(day)
                return
            }
            selectedDays.insert(day)
            
        }
    }
    
    func getBackgroundColor(_ day: Days) -> Color {
        if selectedDays.contains(day) {
            return Color("bgSelectedItem")
        }
        return Color("grayCheckboxButtons")
    }
    
    func getShadow(_ day: Days) -> Color {
        if selectedDays.contains(day) {
            return .black.opacity(0.25)
        }
        return .clear
    }
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(Days.allCases, id: \.self) { day in
                VStack(alignment: .center) {
                    Button(action: selectDay(day)) {
                        Text(day.getDescription().prefix(1))
                            .font(.callout)
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                    }
                }
                .frame(width: 24, height: 24, alignment: .center)
                .background(getBackgroundColor(day))
                .cornerRadius(50)
                .shadow(color: getShadow(day), radius: 4, x: 0.0, y: 4)
                .animation(.easeInOut(duration: 0.05))
            }
        }
    }
}

struct DaysSelector_Previews: PreviewProvider {
    static var previews: some View {
        DaysSelector(.constant([]))
    }
}
