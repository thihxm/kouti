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
    @State var skinColor: Color = Color(.red)
    
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
                Image("Body")
                    .colorMultiply(skinColor)
                Image("Head2")
                    .colorMultiply(color)
                Image("Face")
            }
            Spacer()
            Button(action: {selectedSkin = (selectedSkin + 1) % 14}, label: {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .foregroundColor(Color("light1"))
            })
            VStack {
                ColorPicker("Cabelo", selection: $color, supportsOpacity: false)
                ColorPicker("Corpo", selection: $skinColor, supportsOpacity: false)
            }
        }
    }
}

struct CharacterSkinPicker_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSkinPicker()
    }
}

