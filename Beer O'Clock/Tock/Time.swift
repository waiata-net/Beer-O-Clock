//
//  Hour.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import Foundation

struct Time: Codable, Equatable  {
    
    
    // MARK: - Coding
    
    var hour: Int = 0
    
    var minute: Int = 0
    
    var second: Int = 0
    
    
    /// Initialise as current time
    init() {
        let now = Date.now
        let cal = Calendar.current
        self.hour = cal.component(.hour, from: now)
        self.minute = cal.component(.minute, from: now)
        self.second = cal.component(.second, from: now)
    }
    
    ///Initialise for an hour of the day
    init(hour: Int) {
        self.hour = hour
    }
    
    init(seconds: Double) {
        let s = Int(seconds)
        self.hour = s / 3600
        self.minute = (s % 3600) / 60
        self.second = s % 60
    }
    
    
    var hhmm: String {
        String(format: "%01d:%02d", hour, minute)
    }
    
    
    var seconds: Double {
        get {
            Double(hour * 3600 + minute * 60 + second)
        }
        set {
            self = Self(seconds: newValue)
        }
    }
   
    var components: DateComponents {
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        components.second = second
        return components
    }
    
    
    var past: Date {
        if today.timeIntervalSinceNow > 0 {
            return today
        } else {
            return Calendar.current.date(byAdding: .day, value: -1, to: today) ?? today
        }
    }
    
    var future: Date {
        if today.timeIntervalSinceNow < 0 {
            return today
        } else {
            return Calendar.current.date(byAdding: .day, value: 1, to: today) ?? today
        }
    }
    
    var today: Date {
        get {
            Calendar.current.date(from: components) ?? Date()
        }
        set {
            let components = Calendar.current.dateComponents([.hour, .minute, .second], from: newValue)
            self.hour = components.hour ?? hour
            self.minute = components.minute ?? minute
            self.second = components.second ?? second
        }
    }
    
    
    
//    static func +(lhs: Self, rhs: Self) -> Self {
//        Self(rawValue: lhs.rawValue + rhs.rawValue)
//    }
//    static func -(lhs: Self, rhs: Self) -> Self {
//        Self(rawValue: lhs.rawValue - rhs.rawValue)
//    }
//    static func *(lhs: Self, rhs: Self) -> Self {
//        Self(rawValue: lhs.rawValue * rhs.rawValue)
//    }
//    static func /(lhs: Self, rhs: Self) -> Self {
//        guard rhs.seconds != 0 else { return lhs }
//        return Self(seconds: Int(lhs.seconds / rhs.seconds))
//    }
//    
    static let dayRange: ClosedRange = 0.0...86400
    
}
