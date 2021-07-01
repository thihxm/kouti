//
//  PopUpView.swift
//  PopUpCompra
//
//  Created by Jessica Akemi Meguro on 26/06/21.
//

import SwiftUI

struct PopUpView: View {
    
    var imagemCompra: String
    var price: (Double, String)
    var descricao : String
    var isFIAT: Bool = false
    
    func cleanPrice() -> String {
        let value = price.0
        return value.truncatingRemainder(dividingBy: 1) == 0 ?
            String(format: "%.0f", value) :
            String(format: "%.2f", locale: Locale(identifier: "pt-br"), value)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(imagemCompra)
                .frame(width: 128, height: 112, alignment: .center)
                .background(Color("bg1"))
                .cornerRadius(16)
            
            VStack(spacing: 5) {
                HStack {
                    if !isFIAT {
                        Image("dracma")
                    }
                    Text("\(cleanPrice())\(price.1)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Text(descricao)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            
            Button(action: {}) {
                Text("Comprar")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 35)
                    .font(.callout)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(50)
            }
            .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
        }
        .frame(maxWidth: 318)
        .padding(20)
        .background(Color("purpleGuide"))
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.5), radius: 8)
        .transition(.asymmetric(insertion: .scale(scale: 1.1).combined(with: .opacity), removal: .opacity).animation(.easeInOut(duration: 0.1)))
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(imagemCompra: "plusOne", price: (30, "$"), descricao: "Aumente seu ganho semanal em uma moeda pelo resto da eternidade. Ganhava 10? Ganhe 11!")
    }
}
