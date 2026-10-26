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
        Announce.send(title, text: detail, sound: audio)
    }
    
    static let work = Tick(
        time: Time(hour: 9),
        title: "Work Time",
        detail: "Head Down, Bum Up!",
        audio: "Bell.aif",
        phase: 0
    )
    
    static let beer = Tick(
        time: Time(hour: 17),
        title: "Beer O'Clock!",
        detail: "Time crack open a nice cold one",
        audio: "Beer.aif",
        phase: 1
    )

}
