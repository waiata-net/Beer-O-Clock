//
//  TickView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 23/02/2025.
//

import SwiftUI

struct TickView: View {
    
    @Binding var tick: Tick
    
    var body: some View {
        GroupBox {
            TextField(text: $tick.title) {
                Label("Title", systemImage: "pin")
            }
            HStack {
                DatePicker(selection: $tick.time.today, displayedComponents: .hourAndMinute) {
                    Label("Time", systemImage: "clock")
                }
                .datePickerStyle(.compact)
                Slider(value: $tick.time.seconds, in: 0...86400, step: 15 * 60)
            }
            HStack {
                TextField(text: $tick.detail) {
                    Label("Message", systemImage: "exclamationmark.bubble")
                }
                Toggle("Notify?", isOn: $tick.notify)
            }
            HStack {
                SoundPick(sound: $tick.audio)
                Toggle("Sound?", isOn: $tick.playSound)
            }
        }
        .textFieldStyle(.roundedBorder)
        .labelStyle(.iconOnly)
        
        
    }
}

#Preview {
    @Previewable @State var beer = Tick.beer
    return TickView(tick: $beer)
}
