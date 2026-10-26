//
//  CityPick.swift
//  Umbrella
//
//  Created by Neal Watkins on 03/03/2026.
//

import SwiftUI

struct CityPick: View {

    @AppStorage("city") var city: String = ""
    @AppStorage("longitude") var longitude: Double = 113.54611
    @AppStorage("latitude") var latitude: Double = 22.20056

    @State private var input: String = ""
    var suggestions: [Location] {
        let trim = input.trimmingCharacters(in: .whitespaces)
        return Location.cities.filter {
            guard let city = $0.city else { return false }
            return city.localizedCaseInsensitiveContains(trim)
        }
    }

    var body: some View {
        TextField("City", text: $input)
            .textFieldStyle(.roundedBorder)
            .textInputSuggestions {
                ForEach(suggestions, id: \.self) { loc in
                    Label(loc.city ?? "", systemImage: "leaf")
                        .textInputCompletion(loc.city ?? "")
                }
            }
            .onSubmit {
                guard let location = Location.cities.first(where: { $0.city == input }) else { return }
                city = location.city ?? ""
                longitude = location.longitude
                latitude = location.latitude
                input = city
            }
        .onAppear {
            input = city
            Location.cities = Location.load(csv: "Cities")
        }
    }

    func clear() {
        input = ""
    }

}

#Preview {
    CityPick()
}
