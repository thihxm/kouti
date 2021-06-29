//
//  KoutiView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

struct KoutiView: View {
    @EnvironmentObject var userManager: UserManager
    @State var newUserName: String = ""
    
    func onStartJourney() {
        userManager.changeUserName(to: newUserName)
    }
    
    var body: some View {
        if userManager.isFirstLogin {
            OnBoardingView(userName: $newUserName, onStartJourney: onStartJourney)
        } else {
            NavigationView {
                AppView()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                userManager.updateHistory()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KoutiView()
            .previewDisplayName("Cheio")
            .environmentObject(UserManager.fullState())
        KoutiView()
            .previewDisplayName("Vazio")
            .environmentObject(UserManager.emptyState())
    }
}
