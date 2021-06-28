//
//  AppView.swift
//  Kouti
//
//  Created by Marco Zulian on 26/06/21.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        TabView {
//            MainPageView(userManager: userManager)
            MainPageView()
                .tabItem { Image(systemName: "house") }
            CharacterPageView()
                .tabItem { Image(systemName: "person") }
            Text("Loja").tabItem { Image(systemName: "bag") }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
