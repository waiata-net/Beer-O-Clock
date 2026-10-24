//
//  Tock.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 05/03/2025.
//

import Foundation

struct Tock {
    
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
    
    @Preference(key: "Vessel", def: .pint)
    var vessel: Vessel
    
    @Preference(key: "Liquid", def: .lager)
    var liquid: Liquid
}
