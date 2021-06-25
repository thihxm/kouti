//
//  MainPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct MainPageView: View {
    @State var userManager: UserManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 45) {
            CharacterHeader(user: userManager.user)
                .frame(maxWidth: .infinity)
            TasksDisplay(tasks: userManager.user.tasks)
        }.padding()
        .background(Color("bg1"))
    }
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(userManager: UserManager.fullState())
    }
}
