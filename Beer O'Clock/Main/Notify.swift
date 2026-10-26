//
//  Announce.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 02/03/2026.
//

import Foundation
import UserNotifications

struct Announce {
    
    static let id = "Beer"
    static let center = UNUserNotificationCenter.current()
    static let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    
    static func send(_ title: String? = nil, text: String, sound: String? = nil) {
        
        let content = UNMutableNotificationContent()
        content.title = title ?? ""
        content.body = text
        if let sound {
            content.sound = UNNotificationSound(named: UNNotificationSoundName(sound))
        }
        requestPermission()
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled: \(title ?? "") - \(text)")
            }
        }
    }
    
    /// Requests permission to send notifications.
        static func requestPermission() {
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if let error = error {
                    print("Error requesting authorization: \(error.localizedDescription)")
                }
            }
        }
    
    
}
