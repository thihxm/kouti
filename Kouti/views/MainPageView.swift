//
//  MainPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct MainPageView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            CharacterHeaderAndPicture()
                .frame(maxWidth: .infinity)
            Statistics()
            TasksDisplay(userManager: userManager)
        }.padding()
        .background(Background())
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .environmentObject(UserManager.fullState())
    }
}
