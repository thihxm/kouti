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
            ZStack(alignment: .topTrailing) {
                NavigationLink(
                    destination: NewMissionView(tasks: DefaultTasks.tasks),
                    label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .imageScale(.medium)
                            .frame(width: 30, height: 30, alignment: .center)
                            .background(Color("purpleGuide"))
                            .clipShape(Circle())
                    }
                )
                .shadow(color: .black.opacity(0.25), radius: 3, x: 0.0, y: 1)
                .offset(x: 5, y: -10)
                .zIndex(100)
                TabView {
                    TasksDisplay(userManager: userManager, main: true)
                    TasksDisplay(userManager: userManager, main: false)
                }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 10)
            }
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
