//
//  Weather.swift
//  Umbrella
//
//  Created by Neal Watkins on 02/03/2026.
//

import Foundation

struct Weather: Decodable {
    
    let when: Date?
    let temperature: Measurement<UnitTemperature>
    let precipitation: Measurement<UnitLength>?
    
    private enum RootKeys: String, CodingKey {
        case current_units
        case current
    }
    
    private enum UnitKeys: String, CodingKey {
        case time
        case precipitation
        case temperature
    }
    
    init(from decoder: any Decoder) throws {
        let root = try decoder.container(keyedBy: RootKeys.self)
        let units = try root.nestedContainer(keyedBy: UnitKeys.self, forKey: .current_units)
        let values = try root.nestedContainer(keyedBy: UnitKeys.self, forKey: .current)
        
        let time = try values.decode(String.self, forKey: .time)
        when = ISO8601DateFormatter().date(from: time)
        
        let temp = try values.decode(Double.self, forKey: .temperature)
        let degrees = try units.decode(String.self, forKey: .temperature)
        self.temperature = .init(temp, degrees)
        
        let fall = try values.decode(Double.self, forKey: .precipitation)
        let unit = try units.decode(String.self, forKey: .precipitation)
        self.precipitation = .init(fall, unit)
    }
    
    var isRaining: Bool {
        guard let precipitation else { return false }
        return precipitation.value > 0
    }
    
    enum Temperature {
        case celcius(Double)
        case fahrenheit(Double)
        
        init(_ value: Double, _ unit: String) {
            switch unit {
                case "C", "ºC": self = .celcius(value)
                case "F", "ºF": self = .fahrenheit(value)
            default: self = .celcius(value)
            }
        }
        
        var measurement: Measurement<UnitTemperature> {
            switch self {
            case .celcius(let v): return Measurement(value: v, unit: .celsius)
            case .fahrenheit(let v): return Measurement(value: v, unit: .fahrenheit)
            }
        }
    }
    
}

extension Measurement where UnitType == UnitTemperature {
    init (_ temp: Double, _ unit: String) {
        switch unit {
        case "C", "ºC": self = .init(value: temp, unit: .celsius)
        case "F", "ºF": self = .init(value: temp, unit: .fahrenheit)
        default : self = .init(value: temp, unit: .celsius)
        }
    }
}

extension Measurement where UnitType == UnitLength {
    init (_ value: Double, _ unit: String) {
        switch unit {
        case "mm": self = .init(value: value, unit: .millimeters)
        default : self = .init(value: value, unit: .millimeters)
        }
    }
}
