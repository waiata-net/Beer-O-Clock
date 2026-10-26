//
//  AppSets.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 26/10/2026.
//

import SwiftUI
import ServiceManagement

struct AppSets: View {
    var body: some View {
        LaunchButt()
        QuitButt()
    }
    
    struct LaunchButt: View {
        
        @Environment(\.appearsActive) var appearsActive
        @State private var launchAtLogin = false
        
        
        var body: some View {
            Toggle("Launch at Login", isOn: $launchAtLogin)
                .onChange(of: appearsActive) {
                    if SMAppService.mainApp.status == .enabled {
                        launchAtLogin = true
                    } else {
                        launchAtLogin = false
                    }

                }
                .onChange(of: launchAtLogin) { _, newValue in
                    if newValue == true {
                        try? SMAppService.mainApp.register()
                    } else {
                        try? SMAppService.mainApp.unregister()
                    }
                }
        }
    }
    
    struct QuitButt: View {
        var body: some View {
            Button {
                NSApplication.shared.terminate(nil)
            } label: {
                Label("Quit", systemImage: "power")
            }
            .keyboardShortcut("q")
        }
    }
}

#Preview {
    AppSets()
}
