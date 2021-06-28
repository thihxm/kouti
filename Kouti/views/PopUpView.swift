//
//  PopUpView.swift
//  PopUpCompra
//
//  Created by Jessica Akemi Meguro on 26/06/21.
//

import SwiftUI

struct PopUpView: View {
    
    var imagemCompra: String
    var price : String
    var descricao : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("bg2"))
                .frame(width: 295, height: 370)
                .shadow(color: .black.opacity(0.8), radius: 10.0)
            VStack {
                Spacer()
                    .frame(height:15)
                Image(imagemCompra)
                    .frame(width: 120, height: 120, alignment: .center)
                    .background(Color("bg1"))
                    .cornerRadius(16)
                    .padding(.bottom, 10)
                
                HStack {
                    Image("dracmaIcon")
                    Text("\(price)$")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                
                Text(descricao)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 240)
                
                ZStack {
                    Button {
                    } label: {
                        Text("Comprar")
                            .frame(width: 160, height: 40)
                            .font(.callout)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(16)
                            .padding(.top, 15)
                    }
                }
                Spacer()
                    .frame(height:15)
            }
        }
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(imagemCompra: "streak", price: "30", descricao: "Aumente seu ganho semanal em uma moeda pelo resto da eternidade. Ganhava 10? Ganhe 11!")
    }
}
