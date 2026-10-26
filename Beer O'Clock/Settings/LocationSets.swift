//
//  LocationSets.swift
//  Umbrella
//
//  Created by Neal Watkins on 02/03/2026.
//

import SwiftUI

struct LocationSets: View {
    
    @AppStorage("city") var city: String = ""
    @AppStorage("longitude") var longitude: Double = 113.54611
    @AppStorage("latitude") var latitude: Double = 22.20056
    
    @State private var location: Location?
    
    var body: some View {
        CityPick()
        TextField("Longitude", value: $longitude, format: .number)
        TextField("Latitude", value: $latitude, format: .number)
        Button("Here", systemImage: "target") {
            here()
        }
            
    }
    
    func relocate() {
        guard let location else { return }
        city = location.city ?? ""
        longitude = location.longitude
        latitude = location.latitude
    }
    
    func here() {
        Task {
            guard let loc = try? await Location.here() else { return }
            longitude = loc.longitude
            latitude = loc.latitude
            city = loc.city ?? ""
        }
    }
}

#Preview {
    Form {
        LocationSets()
    }
    .formStyle(.grouped)
}
