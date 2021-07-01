//
//  NotificationHandler.swift
//  Kouti
//
//  Created by Thiago Medeiros on 30/06/21.
//

import Foundation
import SwiftUI

class NotificationManager: ObservableObject {
    static func requestNotificationAuthorization(completion: @escaping  (Bool) -> Void) {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _  in
                // TODO: Fetch notification settings
                completion(granted)
            }
    }
    
    static func getAuthorizationStatus() -> UNAuthorizationStatus {
        var authorizationStatus: UNAuthorizationStatus = .notDetermined
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { permission in
            authorizationStatus = permission.authorizationStatus
        })
        return authorizationStatus
    }
    
    static var alert: Alert {
        Alert(
            title: Text("Erro"),
            message: Text("Não foi possível ativar as notificações! Elas já foram negadas anteriormente."),
            dismissButton: .default(Text("OK"))
        )
    }
    
    func queueTestNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Feed the cat"
        content.subtitle = "It looks hungry"
        content.sound = UNNotificationSound.default
        
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            print(error.debugDescription)
        })
        print("Notification queued!")
    }
    
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
        let content = UNMutableNotificationContent()
        content.title = title
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
        
        let imageName = "logo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
        let request = UNNotificationRequest(identifier: "demoNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
