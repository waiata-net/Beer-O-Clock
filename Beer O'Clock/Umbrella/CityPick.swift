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
    @State var suggestions: [Location] = []
    @State var selectedIndex: Int?

    var body: some View {
        TextField("City", text: $input)
            .textFieldStyle(.roundedBorder)
            .onChange(of: input) {
                suggest()
            }
            .onSubmit {
                suggestions.removeAll()
            }
            .onKeyPress(.upArrow) {
                guard !suggestions.isEmpty else { return .ignored }
                selectedIndex =
                    (selectedIndex?.advanced(by: -1)
                        ?? (suggestions.endIndex - 1)) % suggestions.count
                return .handled
            }
            .onKeyPress(.downArrow) {
                guard !suggestions.isEmpty else { return .ignored }
                selectedIndex =
                    (selectedIndex?.advanced(by: 1) ?? (suggestions.startIndex))
                    % suggestions.count
                return .handled
            }
            .onKeyPress(.return) {
                pick(selectedIndex)
                return .handled
            }
        ScrollViewReader { scrollView in
            List(suggestions.indices, id: \.self, selection: $selectedIndex) {
                index in
                Button(suggestions[index].city ?? "") {
                    pick(index)
                }
                .buttonStyle(.plain)
                .tag(index)
            }
            .listStyle(.plain)
            .frame(maxHeight: 96)
            .onChange(of: selectedIndex) {
                if let index = selectedIndex {
                    withAnimation {
                        scrollView.scrollTo(index, anchor: .center)
                    }
                }
            }
        }
        .onAppear {
            input = city
            Location.cities = Location.load(csv: "Cities")
        }
    }

    func pick(_ index: Int?) {
        guard let index, suggestions.indices.contains(index) else { return }
        let suggestion = suggestions[index]
        city = suggestion.city ?? ""
        input = city
        longitude = suggestion.longitude
        latitude = suggestion.latitude
        suggestions.removeAll()
        selectedIndex = nil
    }

    func suggest() {
        if input.isEmpty {
            suggestions = []
        } else {
            suggestions = Location.cities.filter {
                guard let city = $0.city,
                    input != city
                else { return false }
                return city.lowercased().contains(input.lowercased())
            }
        }
    }
}

#Preview {
    CityPick()
}
