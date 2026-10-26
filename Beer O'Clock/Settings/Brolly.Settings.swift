//
//  Settings.swift
//  Umbrella
//
//  Created by Neal Watkins on 02/03/2026.
//

import SwiftUI

extension Brolly {
    struct Settings {
        @AppStorage("longitude") static var longitude: Double = 113.54611
        @AppStorage("latitude") static var latitude: Double = 22.20056
        @AppStorage("frequency") static var frequency: TimeInterval = 300
        
    }
}
