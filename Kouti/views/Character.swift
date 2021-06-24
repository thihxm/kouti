//
//  Character.swift
//  Kouti
//
//  Created by Marco Zulian on 24/06/21.
//

import SwiftUI

struct Character: View {
    @State var equipedItems: [ItemModel]
    
    var body: some View {
        ZStack {
            Image("Body").resizable().scaledToFit()
            Image("Face").resizable().scaledToFit()
            Image("Hair3").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .hat}.first?.name ?? "").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .bottom}.first?.name ?? "default_bottom").resizable().scaledToFit()
            Image(equipedItems.filter {$0.type == .top}.first?.name ?? "default_top").resizable().scaledToFit()
        }
    }
}

struct Character_Previews: PreviewProvider {
    static var previews: some View {
        Character(equipedItems: [ItemModel(name: "coroa", type: .hat, price: 10),
                                 ItemModel(name: "toga", type: .top, price: 10)])
    }
}
