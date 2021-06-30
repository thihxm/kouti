//
//  Character.swift
//  Kouti
//
//  Created by Marco Zulian on 24/06/21.
//

import SwiftUI

struct Character: View {
    @Binding var equipedItems: [ItemModel]
    @Binding var hairColor: Color
    @Binding var skinColor: Color
    
    var body: some View {
        ZStack {
            Image("Body").resizable().scaledToFit().colorMultiply(skinColor)
            Image("Face").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .hair}.first?.name ?? "").resizable().scaledToFit().colorMultiply(hairColor)
            Image(equipedItems.filter {$0.type == .hat}.first?.name ?? "").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .bottom}.first?.name ?? "default_bottom").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .top}.first?.name ?? "default_top").resizable().scaledToFit()
        }
    }
}
