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
    @State var popUpItem: Item = .plusOne
    
    enum Item: String {
        case plusOne = "plusOne",
             freeze = "freeze",
             double = "doubleCoins",
             dracmas10 = "dracmas10",
             dracmas100 = "dracmas100",
             dracmas550 = "dracmas550"
        
        func getDescription() -> String {
            switch self {
            case .plusOne:
                return "Aumente seu ganho semanal em uma moeda pelo resto da eternidade. Ganhava 10? Ganhe 11!"
            case .freeze:
                return "Congele seu streak por 24h. Perdeu um dia? Sem problemas!"
            case .double:
                return "Dobre suas moedas por uma semana (uso único semanal)"
            case .dracmas10:
                return "Um punhado de 10 dracmas, para te ajudar a avançar em suas missões"
            case .dracmas100:
                return "Uma pequena sacola de 100 dracmas, para te ajudar a avançar em suas missões"
            default:
                return "Algumas notas, ou 550 dracmas, para te ajudar a avançar em suas missões"
            }
        }
        
        func getPrice() -> (Double, String) {
            switch self {
            case .plusOne:
                return (30, "$")
            case .freeze:
                return (50, "$")
            case .double:
                return (20, "$")
            case .dracmas10:
                return (1.90, " BR$")
            case .dracmas100:
                return (5.90, " BR$")
            default:
                return (27.90, " BR$")
            }
        }
        
        func isFIAT() -> Bool {
            switch self {
            case .dracmas10,
                 .dracmas100,
                 .dracmas550:
                return true
            default:
                return false
            }
        }
    }
    
    func buyItem(_ item: Item) -> () -> () {
        return {
            popUpItem = item
            withAnimation {
                openPopUp.toggle()
            }
        }
    }
    
    var body: some View {
        ZStack {
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
                            Image("dracma")
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
            .zIndex(10)

            Ellipse()
                .fill(Color(#colorLiteral(red: 0.4509803922, green: 0.3058823529, blue: 0.1490196078, alpha: 1)).opacity(0.37))
                .frame(width: 340, height: 150, alignment: .center)
                .scaleEffect(1.02)
                .offset(x: 10, y: 215)
            
            Image("hermesStore")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: -30, y: 0)
            
            Group {
                ZStack {
                    Button(action: buyItem(.plusOne)) {
                        Image("plusOne")
                    }
                    .disabled(openPopUp)
                    Image("streakPrice")
                        .offset(x: 36, y: 9)
                }
                .offset(x: -58, y: -11)
                
                ZStack {
                    Button(action: buyItem(.freeze)) {
                        Image("freeze")
                    }
                    .disabled(openPopUp)
                    Image("freezePrice")
                        .offset(x: -21, y: 49)
                }
                .offset(x: 64.5, y: -61)
                
                ZStack {
                    Button(action: buyItem(.double)) {
                        Image("doubleCoins")
                    }
                    .disabled(openPopUp)
                    Image("doublePrice")
                        .offset(x: 1, y: 52)
                }
                .offset(x: -49.5, y: 160)
                
                ZStack {
                    Button(action: buyItem(.dracmas10)) {
                        Image("dracmas10")
                    }
                    .disabled(openPopUp)
                    Image("dracmas10Price")
                        .offset(x: 17, y: 14.5)
                }
                .offset(x: 32, y: 187)
                
                ZStack {
                    Button(action: buyItem(.dracmas100)) {
                        Image("dracmas100")
                    }
                    .disabled(openPopUp)
                    Image("dracmas100Price")
                        .offset(x: 23, y: -21)
                }
                .offset(x: 42, y: 130)
                
                ZStack {
                    Button(action: buyItem(.dracmas550)) {
                        Image("dracmas550")
                    }
                    .disabled(openPopUp)
                    Image("dracmas550Price")
                        .offset(x: 14, y: 20)
                }
                .offset(x: 106, y: 165)
            }
            
            
            
            if openPopUp {
                
                PopUpView(imagemCompra: popUpItem.rawValue, price: popUpItem.getPrice(), descricao: popUpItem.getDescription(), isFIAT: popUpItem.isFIAT())
                    .zIndex(100)
            }
        }
        .onTapGesture {
            openPopUp = false
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Background(color: Color("yellowRedesign"), imageOffset: CGSize(width: -97, height: -68), rectOffset: CGSize(width: 25, height: 331)))
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .environmentObject(UserManager.fullState())
    }
}
