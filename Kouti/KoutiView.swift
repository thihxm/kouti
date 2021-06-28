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
            AppView(userManager: userManager)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            userManager.updateHistory()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KoutiView(userManager: UserManager.fullState())
            .environmentObject(UserManager.fullState())
    }
}
