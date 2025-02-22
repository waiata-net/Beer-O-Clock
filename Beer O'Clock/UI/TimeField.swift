//
//  TimeField.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct TimeField: View {
    
    var label: String = ""
    @Binding var time: Time
    
    var body: some View {
        VStack {
            DatePicker(label, selection: $time.date, displayedComponents: .hourAndMinute)
            Slider(value: $time.seconds, in: 0...86400, step: 15 * 60)
        }
    }

}

#Preview {
    @Previewable @State var time = Time(rawValue: Int.random(in: Time.dayRange))
    TimeField(time: $time)
}
