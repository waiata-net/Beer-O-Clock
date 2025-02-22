//
//  Hour.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import Foundation

struct Time: RawRepresentable, Equatable {
    
    // MARK: - Coding
    
    var hour: Int = 0
    
    var minute: Int = 0
    
    var second: Int = 0
    
    
    // MARK: - Raw Representable
    
    typealias RawValue = Int
    
    var rawValue: Int {
        get {
            hour * 3600 + minute * 60 + second
        }
        set {
            self = .init(rawValue: newValue)
        }
    }
    
    init(rawValue: Int) {
        self = Self(seconds: rawValue)
    }
    
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
    
    init(seconds: Int) {
        self.hour = seconds / 3600
        self.minute = (seconds % 3600) / 60
        self.second = seconds % 60
    }
    
    
    var hhmm: String {
        date.formatted(date: .omitted, time: .shortened)
    }
    
   
    var components: DateComponents {
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        components.second = second
        return components
    }
    
    var date: Date {
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
    
    var seconds: TimeInterval {
        get {
            Double(rawValue)
        }
        set {
            self = Self(seconds: Int(newValue))
        }
    }
    
    static func +(lhs: Self, rhs: Self) -> Self {
        Self(rawValue: lhs.rawValue + rhs.rawValue)
    }
    static func -(lhs: Self, rhs: Self) -> Self {
        Self(rawValue: lhs.rawValue - rhs.rawValue)
    }
    static func *(lhs: Self, rhs: Self) -> Self {
        Self(rawValue: lhs.rawValue * rhs.rawValue)
    }
    static func /(lhs: Self, rhs: Self) -> Self {
        guard rhs.seconds != 0 else { return lhs }
        return Self(seconds: Int(lhs.seconds / rhs.seconds))
    }
    
    static let dayRange: ClosedRange = 0...86400
    
}
