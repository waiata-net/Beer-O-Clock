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
    
    var ticks = Ticks()
    
    var last: Date?
    var next: Date?
    
    var ticker: Timer?
    
    init() {
        update()
        ticker = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.update()
        }
    }
    
    func update() {
        
//        let last = ticks.last
//        
//        if last != self.last {
//            last?.announce()
//            self.last = last
//        }
//        
//        
//        next = ticks.next
//        if let next {
//            remaining = next.time - Time()
//        } else {
//            remaining = nil
//        }
        
    }
    
    
    
    
    var remaining: Time?
    
    var progress: CGFloat = 0
    
    var elapsed: TimeInterval? {
        0
//        guard let last else { return nil }
//        return last.time.date.timeIntervalSinceNow
    }
    
    var duration: TimeInterval? {
        0
//        guard let last, let next else { return nil }
//        return next.time.seconds - last.time.seconds
    }
    
    
}
