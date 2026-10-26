//
//  Brolly.swift
//  Umbrella
//
//  Created by Neal Watkins on 02/03/2026.
//

import Foundation

@Observable
class Brolly {
    
    var weather: Weather?
    var timer: Timer?
    
    init() {
        tock()
    }
    
    func tock() {
        guard let url = Meteo.url(longitude: Settings.longitude, latitude: Settings.latitude) else { return }
        _ = Task {
            let data = try await URLSession.shared.data(from: url).0
            let weather = try? JSONDecoder().decode(Weather.self, from: data)
            self.weather = weather
            self.tick()
            self.announce()
        }
    }
    
    func tick() {
        timer?.invalidate()
        guard Settings.frequency > 0 else { return }
        timer = Timer.scheduledTimer(withTimeInterval: Settings.frequency, repeats: false) { [weak self] timer in
            self?.tock()
        }
    }
    
    func announce() {
        if weather?.isRaining == true {
            Announce.send("It's Raining!", text: "Grab an Umbrella")
        }
    }
    
}
