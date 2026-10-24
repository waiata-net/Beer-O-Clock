//
//  Meteo.swift
//  Umbrella
//
//  Created by Neal Watkins on 02/03/2026.
//

import Foundation

struct Meteo {
    
    static let base = "https://api.open-meteo.com/v1/forecast"
    
    static func url(longitude: Double, latitude: Double) -> URL? {
        URL(string: base)?.appending(queryItems: [
            URLQueryItem(name: "longitude", value: String(longitude)),
            URLQueryItem(name: "latitude", value: String(latitude)),
            URLQueryItem(name: "current", value: "precipitation,temperature"),
        ])
    }
    
}
