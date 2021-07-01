//
//  ColorPicker.swift
//  Kouti
//
//  Created by Marco Zulian on 28/06/21.
//

import SwiftUI

struct Colors: View {
    @Binding var color: Color
    
    var body: some View {
        HStack (alignment: .bottom) {
//            ColorPicker(selection: $color, label: {
//                EmptyView()
//            })
            Button(action: {color = .red}, label: {
                Circle().foregroundColor(.red).frame(maxWidth:25, maxHeight: 25)
            })
            Button(action: {color = .blue}, label: {
                Circle().foregroundColor(.blue).frame(maxWidth:25, maxHeight: 25)
            })
            Button(action: {color = .yellow}, label: {
                Circle().foregroundColor(.yellow).frame(maxWidth:25, maxHeight: 25)
            })
            Button(action: {color = .green}, label: {
                Circle().foregroundColor(.green).frame(maxWidth:25, maxHeight: 25)
            })
            ColorPicker(selection: $color, label: {
                EmptyView()
            }).frame(maxWidth:25, maxHeight: 25)
            Spacer()
        }
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Character(equipedItems: .constant([]), hairColor: .constant(.green), skinColor: .constant(.gray))
    }
}
