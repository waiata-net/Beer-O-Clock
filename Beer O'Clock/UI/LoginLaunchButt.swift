//
//  LoginLaunchButt.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 02/03/2025.
//

import SwiftUI
import ServiceManagement

struct LoginLaunchButt: View {
    
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

#Preview {
    LoginLaunchButt()
}
