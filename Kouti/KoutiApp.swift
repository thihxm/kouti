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
    
    var body: some Scene {
        WindowGroup {
            KoutiView(userManager: userManager)
        }
    }
}
