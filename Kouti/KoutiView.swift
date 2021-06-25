//
//  KoutiView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

struct KoutiView: View {
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        NavigationView {
            TabView {
                MainPageView(userManager: userManager)
                    .tabItem { Image(systemName: "house") }
                CharacterPageView(userManager: userManager)
                    .tabItem { Image(systemName: "person") }
                Text("Loja").tabItem { Image(systemName: "bag") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KoutiView(userManager: UserManager.fullState())
    }
}
