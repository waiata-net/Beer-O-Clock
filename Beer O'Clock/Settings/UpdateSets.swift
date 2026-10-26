//
//  UpdateSets.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 26/10/2026.
//

import SwiftUI

struct UpdateSets: View {
    
    @Environment(Brolly.self) var brolly
    @AppStorage("frequency") var frequency: TimeInterval = 3600
    
    var body: some View {
        Picker("Update Weather", selection: $frequency) {
            Text("Every Minute").tag(60.0)
            Text("Every 5 Minutes").tag(300.0)
            Text("Every Quarter Hour").tag(900.0)
            Text("Every Half Hour").tag(1800.0)
            Text("Hourly").tag(3600.0)
        }
        .onSubmit {
            brolly.tock()
        }
        Button("Now", systemImage: "tornado") {
            brolly.tock()
        }
    }
}

#Preview {
    UpdateSets()
        .environment(Brolly())
}
