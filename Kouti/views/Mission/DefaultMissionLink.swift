//
//  DefaultMissionLink.swift
//  Kouti
//
//  Created by Thiago Medeiros on 22/06/21.
//

import SwiftUI

struct DefaultMissionLink: View {
    var sticker = "adesivo_cheio"
    var label = "Caminhada"
    var body: some View {
        HStack(spacing: 15) {
            Image(sticker)
                .resizable()
                .scaledToFill()
                .frame(width: 34, height: 32, alignment: .center)
            Text(label)
                .font(.headline)
                .foregroundColor(Color("bg4"))
            Spacer()
            Image(systemName: "plus.app.fill")
                .accentColor(Color("grayAddButton"))
                .foregroundColor(Color("grayAddButton"))
                .font(.system(size: 23, weight: .semibold, design: .default))
                .frame(width: 20, height: 20, alignment: .center)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .padding(15)
        .background(Color("grayBgButtons"))
        .cornerRadius(10)
    }
}

struct DefaultMissionLink_Previews: PreviewProvider {
    static var previews: some View {
        DefaultMissionLink()
    }
}
