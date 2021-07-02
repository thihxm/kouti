//
//  OnBoardView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 28/06/21.
//

import SwiftUI

fileprivate struct boxPresentationView: View {
    let description: Text
    
    init(_ description: Text) {
        self.description = description
    }
    
    var body: some View {
        VStack(spacing: 75) {
            Spacer(minLength: 300)
            
            Image("pandorasBox")
            
            description
                .padding(.horizontal, 66)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("bgOnBoarding"))
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
    }
}

fileprivate struct clickableBoxView: View {
    @Binding var showAnimation: Bool
    
    var body: some View {
        VStack(spacing: 75) {
            Text("Clique na caixa para abrí-la")
                .padding(.horizontal, 66)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("bgOnBoarding"))
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                showAnimation = true
            }) {
                Image("pandorasBox")
            }
        }
    }
}

fileprivate struct hermesChatView: View {
    enum HermesState: String {
        case sad = "sadHermes", happy = "happyHermes", sign = "signHermes"
    }
    
    let description: Text
    let hermesState: HermesState
    
    init(_ description: Text, hermesState: HermesState) {
        self.description = description
        self.hermesState = hermesState
    }
    
    var body: some View {
        VStack(spacing: 75) {
            description
                .frame(maxWidth: 318)
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("light3"))
                .fixedSize(horizontal: false, vertical: true)
                .background(Color("bg4"))
                .cornerRadius(16)
            
            Image(hermesState.rawValue)
                .offset(x: hermesState == .sign ? 30 : 0, y: 0)
        }
    }
}

fileprivate struct enterNameView: View {
    @Binding var userName: String
    @State var inputBorderColor: Color = Color("light3")
    var onStartJourney: () -> Void = {}
    
    func saveName() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        if userName.isEmpty {
            inputBorderColor = Color("red").opacity(0.8)
            return
        }
        
        onStartJourney()
    }
    
    var body: some View {
        VStack(spacing: 27) {
            Image("logo")
                .padding(.bottom, 20)

            VStack(spacing: 20) {
                Text("Termo de responsabilidade")
                    .font(.title2)
                    .bold()
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("O humano destinatário se compromete em coletar todos os monstros que estavam na Caixa de Pandora, por meio da conclusão de suas missões.")
                        .font(.body)
                    Text("*Esse contrato é regido pelo rio Estige.")
                        .font(.footnote)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "person")
                            .font(.title2)
                        ZStack(alignment: .leading) {
                            if userName.isEmpty {
                                Text("Escreva seu nome aqui...")
                                    .foregroundColor(Color("light1").opacity(0.6))
                            }
                            TextField(
                                "",
                                text: $userName,
                                onEditingChanged: { _ in
                                    inputBorderColor = Color("light3")
                                },
                                onCommit: saveName
                            )
                            .font(.body)
                        }
                    }
                    .padding(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                inputBorderColor,
                                lineWidth: 2
                            )
                            .animation(.easeInOut(duration: 0.05))
                    )
                    
                    Text("Assinatura do destinatário")
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: 318)
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .multilineTextAlignment(.leading)
            .foregroundColor(Color("light3"))
            .fixedSize(horizontal: false, vertical: true)
            .background(Color("bg4"))
            .cornerRadius(16)
            
            Button(action: saveName) {
                Text("Iniciar jornada")
                    .foregroundColor(Color("dark1"))
                    .font(.callout)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 20)
                    .background(Color("light3"))
                    .cornerRadius(16)
            }
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
}

struct OnBoardingView: View {
    @State var showAnimation: Bool = false
    @State var animationEnded: Bool = false
    @State var selectedTab: Int = 0
    
    @Binding var userName: String
    var onStartJourney: () -> Void
    
    func getBackgroundColor() -> Color {
        if selectedTab == 3 || selectedTab == 4 {
            return Color("purpleGuide")
        }
        if selectedTab == 6 {
            return Color("dark1")
        }
        return Color("bgOptional")
    }
    
//    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//    .background(Color("bgOptional").edgesIgnoringSafeArea(.all))
    
    init(userName: Binding<String>, onStartJourney: @escaping () -> Void = {}) {
        self._userName = userName
        self.onStartJourney = onStartJourney
    }
    
    func isAnimationEnabled() -> Bool {
        return showAnimation && !animationEnded
    }
    
    var body: some View {
        ZStack {
            getBackgroundColor().edgesIgnoringSafeArea(.all).animation(.easeInOut.speed(2))
            if !animationEnded {
                TabView(selection: $selectedTab) {
                    boxPresentationView(Text("Você recebeu uma encomenda misteriosa, a caixa ornamentada agora cintila e estremece o chão da sua casa..."))
                        .tag(0)
                    boxPresentationView(Text("Diversos adesivos estão colados na entrega, as palavras \(Text("cuidado").fontWeight(.bold)) e \(Text("urgente").fontWeight(.bold)) em letras gigantes, mas é como se a caixa estivesse sussurrando em seu ouvido para abrí-la..."))
                        .tag(1)
                    clickableBoxView(showAnimation: $showAnimation)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .zIndex(1)
            }
            
            PandoraAnimation(animationEnded: $animationEnded, playAnimation: $showAnimation)
                .opacity(isAnimationEnabled() ? 1 : 0)
                .zIndex(isAnimationEnabled() ? 100 : 0)
                .onChange(of: animationEnded) { _ in
                    selectedTab = 3
                }
            
            if animationEnded {
                TabView(selection: $selectedTab) {
                    hermesChatView(Text("Essa entrega não era pra você! Como vou explicar que soltou todos os monstros mundo a fora? Agora você vai ter que caçá-los..."), hermesState: .sad)
                        .tag(3)
                    hermesChatView(Text("A caixa de Pandora foi aberta e agora para restaurar o equilíbrio do mundo, você deve cumprir suas missões para combater o mal."), hermesState: .happy)
                        .tag(4)
                    hermesChatView(Text("Assine seu nome aqui e aprenda a não abrir caixas que não lhe pertencem! Lembre-se: \(Text("para melhorar o mundo você deve melhorar a si mesmo.").fontWeight(.bold))"), hermesState: .sign)
                        .tag(5)
                    enterNameView(userName: $userName, onStartJourney: onStartJourney)
                        .tag(6)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .zIndex(2)
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(userName: .constant(""))
    }
}
