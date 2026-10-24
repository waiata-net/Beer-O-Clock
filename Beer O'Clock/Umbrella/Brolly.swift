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
    
    func tock() {
        guard let url = Meteo.url(longitude: Settings.longitude, latitude: Settings.latitude) else { return }
        Task {
            let data = try await URLSession.shared.data(from: url).0
            let weather = try? JSONDecoder().decode(Weather.self, from: data)
            self.weather = weather
            self.tick()
            self.notify()
        }
    }
    
    func tick() {
        timer?.invalidate()
        guard Settings.frequency > 0 else { return }
        timer = Timer.scheduledTimer(withTimeInterval: Settings.frequency, repeats: false) { [weak self] timer in
            self?.tock()
        }
    }
    
    func notify() {
        if weather?.isRaining == true {
            Notify.send("It's Raining!", "Grab an Umbrella")
        }
    }
    
    var icon: String {
        return switch weather?.isRaining {
        case true: "☔️"
        case false: "🌂"
        default: "☂"
        }
    }
}
