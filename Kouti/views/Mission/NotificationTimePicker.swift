//
//  NotificationTimePicker.swift
//  Kouti
//
//  Created by Thiago Medeiros on 21/06/21.
//

import SwiftUI

struct NotificationTimePicker: View {
    let label: String
    @State var alertTime: Date
    
    init(_ label: String, alertTime: State<Date> = State(initialValue: Date())) {
        self.label = label
        self._alertTime = alertTime
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(Color("dark1"))
            
            Spacer()
            
            DatePicker(label, selection: $alertTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
        }
    }
}

struct NotificationTimePicker_Previews: PreviewProvider {
    static var previews: some View {
        NotificationTimePicker("Alerta 1")
            .environment(\.locale, .init(identifier: "br"))
    }
}
