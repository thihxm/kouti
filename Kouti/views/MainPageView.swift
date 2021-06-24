//
//  MainPageView.swift
//  Kouti
//
//  Created by Marco Zulian on 22/06/21.
//

import SwiftUI

struct MainPageView: View {
    @Binding var user: UserModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 45) {
            CharacterHeaderAndPicture(user: $user)
                .frame(maxWidth: .infinity)
            TasksDisplay(tasks: user.tasks)
        }.padding()
        .background(Color("bg1").edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
