//
//  Vessel.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 05/03/2025.
//

import SwiftUI

enum Liquid: String, Codable, Equatable, CaseIterable {
    case lager
    case ale
    case stout
    case cider
    case chardonnay
    case rose
    case merlot
    
    
    var title: String {
        rawValue.localizedCapitalized
    }
    
    var color: Color {
        switch self {
            
        case .lager: .lager
        case .ale: .ale
        case .stout: .stout
        case .cider: .cider
        case .chardonnay: .chardonnay
        case .rose: .rose
        case .merlot: .merlot
        }
    }
    
    var bodyHeight: CGFloat {
        switch self {
        case .lager: 0.69
        case .ale: 0.72
        case .stout: 0.69
        case .cider: 0.88
        case .chardonnay: 0.98
        case .rose: 0.98
        case .merlot: 0.98
        }
    }
    
    var headHeight: CGFloat {
        switch self {
        case .lager: 0.88
        case .ale: 0.8
        case .stout: 0.9
        case .cider: 0.96
        case .chardonnay: 0.99
        case .rose: 0.99
        case .merlot: 0.99
        }
    }
    
    var stops: [Gradient.Stop] {
        [
            Gradient.Stop(color: color, location: 0),
            Gradient.Stop(color: color, location: bodyHeight),
            Gradient.Stop(color: .head, location: headHeight),
            Gradient.Stop(color: .clear, location: 1)
        ]
    }
    
}
