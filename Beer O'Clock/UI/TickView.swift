//
//  TickView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 23/02/2025.
//

import SwiftUI

struct TickView: View {
    
    @Binding var tick: Tick
    
    @AppStorage("Tick Disclose") var disclose = true
    
    var body: some View {
        GroupBox {
            VStack(spacing: 12) {
                Toggle(isOn: $disclose) {
                    Text("\(tick.title) \(tick.time.hhmm)")
                        .font(.headline)
                }
                .toggleStyle(DisclosureToggle())
                if (disclose) {
                    TextField("Title", text: $tick.title)
                    HStack {
                        DatePicker("", selection: $tick.time.today, displayedComponents: .hourAndMinute)
                        Slider(value: $tick.time.seconds, in: 0...86400, step: 15 * 60)
                    }
                    HStack {
                        Toggle("Notify?", isOn: $tick.notify)
                        TextField(text: $tick.detail) {
                            Label("Message", systemImage: "exclamationmark.bubble")
                        }
                    }
                    HStack {
                        Toggle("Sound?", isOn: $tick.playSound)
                        SoundPick(sound: $tick.audio)
                    }
                }
            }
            .padding(.horizontal)
        }
        .textFieldStyle(.roundedBorder)
        
        
    }
    
    struct DisclosureToggle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack {
                Button {
                    withAnimation {
                        configuration.isOn.toggle()
                    }
                } label: {
                    HStack(alignment: .firstTextBaseline) {
                        configuration.label
                        Image(systemName: configuration.isOn ? "chevron.down" : "chevron.right")
                            .animation(nil, value: configuration.isOn)
                        Spacer()
                    }
                    .font(.callout)
                    .contentShape(Rectangle())
                    .padding(6)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    @Previewable @State var beer = Tick.beer
    return TickView(tick: $beer)
}
