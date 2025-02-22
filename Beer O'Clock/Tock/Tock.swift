//
//  Tock.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import Foundation
import Combine

@Observable
class Tock {

    var times = Times() {
        didSet { update() }
    }
    
    var ticker: Timer?
    
    init() {
        update()
        ticker = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.update()
        }
    }
    
    
    func update() {
        guard elapsed.seconds > 0,
              duration.seconds > 0
        else { return }
        progress = elapsed.seconds / duration.seconds
        
        let delta = times.beer - Time()
        remaining = delta.seconds > 0 ? delta : nil
        
    }
    
    var remaining: Time?
    
    var progress: CGFloat = 0
    
    var elapsed: Time {
        Time() - times.work
    }
    
    var duration: Time {
        times.beer - times.work
    }
    
    struct Times {
        @Preference(key: "Work Time", def: Time(hour: 9))
        var work: Time
        
        @Preference(key: "Beer Time", def: Time(hour: 17))
        var beer: Time
    }
}
