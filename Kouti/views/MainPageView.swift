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
        VStack(alignment: .leading, spacing: 45) {
            CharacterHeaderAndPicture()
                .frame(maxWidth: .infinity)
            TasksDisplay()
        }.padding()
        .background(Color("bg1").edgesIgnoringSafeArea(.all))
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
