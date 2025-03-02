//
//  Tick.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import Foundation
import UserNotifications

struct Tick: Codable, Equatable {
    
    var time: Time
    var title: String
    var detail: String
    var audio: String = ""
    var notify: Bool = true
    var playSound: Bool = true
    var phase: CGFloat = 0
    
    var sound: UNNotificationSound? {
        return UNNotificationSound(named: UNNotificationSoundName(audio))
    }
    
    func announce() {
        guard notify else { return }
        Self.requestPermission()
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = detail
        if playSound {
            content.sound = sound
        }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    static let work = Tick(
        time: Time(hour: 9),
        title: "Work Time",
        detail: "Head Down, Bum Up!"
    )
    
    static let beer = Tick(
        time: Time(hour: 17),
        title: "Beer O'Clock!",
        detail: "Time crack open a nice cold one",
        audio: "Beer.mp3",
        phase: 1
    )
    
    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Ticks {
    
    @Preference(key: "Ticks", def: [.work, .beer])
    var ticks: [Tick]
    
    subscript(_ index: Int) -> Tick {
        get {
            ticks[index]
        }
        set {
            ticks[index] = newValue
        }
    }
    
    var last: Tick? {
        ticks.max {
            $0.time.past < $1.time.past
        }
    }
    
    var next: Tick? {
        return ticks.min {
            $0.time.future < $1.time.future
        }
    }
}
