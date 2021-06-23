//
//  CharacterSkinPicker.swift
//  Kouti
//
//  Created by Marco Zulian on 23/06/21.
//

import SwiftUI

struct CharacterSkinPicker: View {
    @State var selectedSkin: Int = 1
    @State var color: Color = Color(.red)
    
    var body: some View {
        HStack {
            Button(action: {
                if selectedSkin == 0 {
                    selectedSkin = 13
                } else {
                    selectedSkin -= 1
                }
            }, label: {
                Image(systemName: "arrowtriangle.left.fill")
                    .resizable()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .foregroundColor(Color("light1"))
            })
            Spacer()
            
            ZStack {
                Image("CharacterSkin\(selectedSkin)")
                Image("Head2")
                    .offset(x: 0, y: -105)
                    .colorMultiply(color)
            }
            Spacer()
            Button(action: {selectedSkin = (selectedSkin + 1) % 14}, label: {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .foregroundColor(Color("light1"))
            })
            ColorPicker("Cor", selection: $color)
        }
    }
}

struct CharacterSkinPicker_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSkinPicker()
    }
}

