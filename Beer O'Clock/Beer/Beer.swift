//
//  Beer.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import Foundation
import Combine

@Observable
class Beer {
    
    var tock = Tock() {
        didSet { change() }
    }
    
    var past: Tick?
    var next: Tick?
    
    var ticker: Timer?
    
    init() {
        check()
        ticker = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.check()
        }
    }
    
    func change() {
        update()
        
    }
    
    func check() {
        let past = tock.past
        
        if self.past != past {
            past?.announce()
        }
        
        update()
    }
    
    func update() {
        
        self.past = tock.past
        self.next = tock.next
        
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
        guard let past, let next else { return 1 }
        return next.phase - past.phase
    }
    
    var remaining: TimeInterval?
    
    var progress: CGFloat {
        guard let elapsed, let duration else { return 0 }
        return elapsed / duration
    }
    
    var elapsed: TimeInterval? {
        guard let past else { return nil }
        return Date.now.timeIntervalSince(past.time.past)
    }
    
    var duration: TimeInterval? {
        guard let past, let next else { return nil }
        return next.time.future.timeIntervalSince(past.time.past)
    }
    
    
}
