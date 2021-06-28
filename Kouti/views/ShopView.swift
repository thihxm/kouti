//
//  ShopView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 28/06/21.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var userManager: UserManager
    
    @State var openPopUp = false
    
    func clickPotion1() {
        openPopUp.toggle()
    }

    var body: some View {
        ZStack {
            Image("hermesStore")
                .offset(x: -30, y: 0)
            VStack {
                VStack(spacing: 0) {
                    Image("Coin")
                    Text("\(userManager.user.character.money)$")
                }
                .offset(x: 3, y: 0)
                .frame(width: 66, height: 55, alignment: .center)
                .background(Color("bg2"))
                .clipShape(RoundedCorner(radius: 17, corners: [.topLeft, .bottomLeft]))
            }.offset(x: 165, y: -300)
            
            Button(action: clickPotion1) {
                Image("potion1")
                    .offset(x: -62, y: -14)
            }
            
            if openPopUp {
                PopUpView(imagemCompra: "potion1", price: "30", descricao: "Aumente seu ganho semanal em uma moeda pelo resto da eternidade. Ganhava 10? Ganhe 11!")
            }
        }
        .onTapGesture {
            openPopUp = false
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg6"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .environmentObject(UserManager.fullState())
    }
}
