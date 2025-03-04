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
    
    var ticks = Ticks() {
        didSet {
            update()
        }
    }
    
    var last: Tick?
    var next: Tick?
    
    var ticker: Timer?
    
    init() {
        update()
        ticker = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.update()
        }
    }
    
    func update() {
        
        let last = ticks.last
        
        if last?.title != self.last?.title {
            last?.announce()
            self.last = last
        }
    
        
        next = ticks.next
        if let next {
            
            remaining = next.time.future.timeIntervalSinceNow
            
            
        }
        
        if direction > 0 {
            phase = progress * direction
        } else {
            phase = 1 + progress * direction
        }
        
        
        
    }
    
    var phase: CGFloat = 0
    
    var direction: CGFloat {
        guard let last, let next else { return 1 }
        return next.phase - last.phase
    }
    
    var remaining: TimeInterval?
    
    var progress: CGFloat {
        guard let elapsed, let duration else { return 0 }
        return elapsed / duration
    }
    
    var elapsed: TimeInterval? {
        guard let last else { return nil }
        return Date.now.timeIntervalSince(last.time.past)
    }
    
    var duration: TimeInterval? {
        guard let last, let next else { return nil }
        return next.time.future.timeIntervalSince(last.time.past)
    }
    
    
}
