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
            Ellipse()
                .fill(Color(#colorLiteral(red: 0.4509803922, green: 0.3058823529, blue: 0.1490196078, alpha: 1)).opacity(0.37))
                .frame(width: 330, height: 150, alignment: .center)
                .scaleEffect(1.08)
                .offset(x: 3, y: 225)
                
            Image("hermesStore")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.08)
                .offset(x: -30, y: 0)
                
            VStack {
                VStack {
                    HStack {
                        Text("Lojinha do Hermes")
                            .foregroundColor(Color("bg6"))
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.leading, 25)
                            .padding(.trailing, 35)
                            .frame(maxHeight: 55, alignment: .center)
                            .background(Color.white)
                            .clipShape(RoundedCorner(radius: 17, corners: [.topRight, .bottomRight]))
                        
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Image("Coin")
                            Text("\(userManager.user.character.money)$")
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                        .padding(.leading, 10)
                        .frame(width: 70, height: 55, alignment: .center)
                        .background(Color.white)
                        .clipShape(RoundedCorner(radius: 17, corners: [.topLeft, .bottomLeft]))
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            
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
        .background(Background(color: Color("bgShop"), imageOffset: CGSize(width: -97, height: -68), rectOffset: CGSize(width: 25, height: 331)))
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .environmentObject(UserManager.fullState())
    }
}
