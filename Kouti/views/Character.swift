//
//  Character.swift
//  Kouti
//
//  Created by Marco Zulian on 24/06/21.
//

import SwiftUI

struct Character: View {
    @Binding var equipedItems: [ItemModel]
    
    // TODO: Ajustes na face e hair
    var body: some View {
        ZStack {
            Image("Body").resizable().scaledToFit()
            Image("Face").resizable().scaledToFit()
            Image("Hair5").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .hat}.first?.name ?? "").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .bottom}.first?.name ?? "default_bottom").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .top}.first?.name ?? "default_top").resizable().scaledToFit()
        }
    }
}
