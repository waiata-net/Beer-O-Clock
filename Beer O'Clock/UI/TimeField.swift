//
//  TimeField.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct TimeField: View {
    
    @Binding var time: Time
    
    var body: some View {
        HStack {
            DatePicker(selection: $time.today, displayedComponents: .hourAndMinute) {
                Label("Time", systemImage: "clock")
            }
            .datePickerStyle(.compact)
            Slider(value: $time.seconds, in: 0...86400, step: 15 * 60)
        }
    }

}

#Preview {
    @Previewable @State var time = Time(seconds: Double.random(in: Time.dayRange))
    TimeField(time: $time)
}
