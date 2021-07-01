//
//  KoutiApp.swift
//  Kouti
//
//  Created by Thiago Medeiros on 18/06/21.
//

import SwiftUI

@main
struct KoutiApp: App {
    
    @StateObject var userManager = UserManager()
    @StateObject var notificationManager = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            KoutiView()
                .environmentObject(userManager)
                .environmentObject(notificationManager)
        }
    }
}
