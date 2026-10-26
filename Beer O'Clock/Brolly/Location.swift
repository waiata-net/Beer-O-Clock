//
//  Location.swift
//  Umbrella
//
//  Created by Neal Watkins on 03/03/2026.
//

import Foundation

struct Location: Codable, Hashable {
    
    var longitude: Double
    var latitude: Double
    var city: String?
    
    init(longitude: Double, latitude: Double, city: String? = nil) {
        self.longitude = longitude
        self.latitude = latitude
        self.city = city
    }
    
    init?(csv: String) {
        let col = csv.split(separator: ",").map(String.init)
        guard col.count >= 3,
              let lon = Double(col[1]),
              let lat = Double(col[2])
        else { return nil }
        self.longitude = lon
        self.latitude = lat
        self.city = col[0]
    }
    
    static func here() async throws -> Location? {
        guard let url = hereURL() else { return nil }
        let data = try await URLSession.shared.data(from: url).0
        let loc = try? JSONDecoder().decode(Location.self, from: data)
        return loc
    }
    
    static func hereURL() -> URL? {
        URL(string: "https://api.bigdatacloud.net/data/reverse-geocode-client")
    }
    
    static var cities: [Location] = []
    
    static func load(csv file: String = "Cities") -> [Location] {
        guard let url = Bundle.main.url(forResource: file, withExtension: "csv"),
              let str = try? String(contentsOf: url, encoding: .utf8)
        else { return [] }
        let rows = str.components(separatedBy: .newlines)
        return rows.compactMap { Location(csv: $0) }
    }
}
