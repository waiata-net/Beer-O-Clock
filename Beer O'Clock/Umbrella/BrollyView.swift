//
//  BrollyView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 24/10/2026.
//

import SwiftUI

struct BrollyView: View {
    
    @Environment(Brolly.self) var brolly
    
    var body: some View {
        MeasurementView(measurement: brolly.weather?.temperature)
        MeasurementView(measurement: brolly.weather?.precipitation)
    }
}

#Preview {
    BrollyView()
        .environment(Brolly())
}
