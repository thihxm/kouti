//
//  DefaultMissionLink.swift
//  Kouti
//
//  Created by Thiago Medeiros on 22/06/21.
//

import SwiftUI

struct DefaultMissionLink: View {
    var sticker = "menos celular"
    var label = "Menos celular"
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Text(label)
                    .font(.headline)
                    .foregroundColor(Color("purpleGuide"))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                Spacer()
                Image(sticker)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 85, alignment: .center)
                    .scaledToFit()
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 23)
            .frame(width: 152, height: 159)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.2), radius: 5, y: 5)
            
            
            Image(systemName: "plus")
                .font(.headline)
                .padding(.horizontal, 25)
                .padding(.vertical, 4)
                .background(Color.white)
                .cornerRadius(50)
                .foregroundColor(Color("purpleGuide"))
                .offset(y: 16)
                .shadow(color: .black.opacity(0.2), radius: 5, y: 5)
        }.padding(.bottom, 30)
    }
}

struct DefaultMissionLink_Previews: PreviewProvider {
    static var previews: some View {
        DefaultMissionLink()
    }
}
