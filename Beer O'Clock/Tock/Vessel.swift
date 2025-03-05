//
//  Vessel.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 05/03/2025.
//

import Foundation

enum Vessel: String, Codable, Equatable, CaseIterable {
    case pint
    case handle
    case pilsner
    case goblet
    case tulip
    case dimple
    
    
    var title: String {
        rawValue.localizedCapitalized
    }
    
    var glass: String {
        rawValue.capitalized + "-Glass"
    }
    
    var fill: String {
        rawValue.capitalized + "-Fill"
    }
    
}
