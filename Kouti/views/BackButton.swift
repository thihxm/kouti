//
//  BackButton.swift
//  Kouti
//
//  Created by Thiago Medeiros on 01/07/21.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var color: Color = Color("purpleGuide")

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                Text("Voltar")
                Spacer()
            }
            .font(.headline)
            .foregroundColor(color)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
