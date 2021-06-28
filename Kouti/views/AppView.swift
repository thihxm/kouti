//
//  AppView.swift
//  Kouti
//
//  Created by Marco Zulian on 26/06/21.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var userManager: UserManager
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
//            MainPageView(userManager: userManager)
            MainPageView()
                .tabItem { Image(systemName: selectedTab == 0 ? "house.fill" : "house") }
                .tag(0)
            CharacterPageView()
                .tabItem { Image(systemName: selectedTab == 1 ? "person.fill" : "person") }
                .tag(1)
            Text("Loja").tabItem { Image(systemName: selectedTab == 2 ? "bag.fill" : "bag") }
                .tag(2)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
