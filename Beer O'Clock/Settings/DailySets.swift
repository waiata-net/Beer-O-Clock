//
//  DailySets.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 23/02/2025.
//

import SwiftUI

struct DailySets: View {
    
    @Environment(Beer.self) var beer: Beer
    
    @AppStorage("Tick Disclose") var disclose = true
    
    var body: some View {
        
        @Bindable var beer = beer
        
        ForEach(beer.tock.ticks.indices, id: \.self) {
            TickSets(tick: $beer.tock.ticks[$0])
        }
        
    }
    
    struct TickSets: View {
        
        @Binding var tick: Tick
        @State var disclose = false
        
        var body: some View {
            
            HStack {
                DatePicker("", selection: $tick.time.today, displayedComponents: .hourAndMinute)
                TextField("", text: $tick.title)
            }
            
            HStack {
                Togg(on: $tick.notify, onIcon: "bubble.fill", offIcon: "bubble")
                TextField("", text: $tick.detail)
                    .foregroundStyle(tick.notify ? .primary : .secondary)
            }
            
            HStack {
                Togg(on: $tick.playSound, onIcon: "bell.fill", offIcon: "bell")
                SoundPick(sound: $tick.audio)
            }
            Divider()
            
        }
//
//                Toggle(isOn: $disclose) {
//                    Text("\(tick.title) \(tick.time.hhmm)")
//                        .font(.headline)
//                }
//                .toggleStyle(DisclosureToggle())
//                if (disclose) {
//                    TextField("Title", text: $tick.title)
//                    HStack {
//                        DatePicker("", selection: $tick.time.today, displayedComponents: .hourAndMinute)
//                        Slider(value: $tick.time.seconds, in: 0...86400, step: 15 * 60)
//                    }
//                    HStack {
//                        Toggle("Notify?", isOn: $tick.notify)
//                        TextField(text: $tick.detail) {
//                            Label("Message", systemImage: "exclamationmark.bubble")
//                        }
//                    }
//                    HStack {
//                        Toggle("Sound?", isOn: $tick.playSound)
//                        SoundPick(sound: $tick.audio)
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//        .textFieldStyle(.roundedBorder)
        
        
    }
    
    struct Togg: View {
        
        @Binding var on: Bool
        var onIcon = "checkmark.square.fill"
        var offIcon = "square"
        
        
        var body: some View {
            
            Toggle(isOn: $on) {
                Image(systemName: on ? onIcon : offIcon)
            }
            .toggleStyle(.button)
            
//
        }
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
    Form {
        DailySets()
    }
    .environment(Beer())
    .formStyle(.grouped)
}
