//
//  MeasurementView.swift
//  Umbrella
//
//  Created by Neal Watkins on 02/03/2026.
//

import SwiftUI

struct MeasurementView<U: Unit>: View {
    var measurement: Measurement<U>?
    var body: some View {
        if let measurement {
            HStack {
                Text(measurement.value, format: .number)
                Text(measurement.unit.symbol)
            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    MeasurementView()
}
