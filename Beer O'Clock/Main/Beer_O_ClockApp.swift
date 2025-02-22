//
//  Beer_O_ClockApp.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

@main
struct Beer_O_ClockApp: App {
    
    @State var tock = Tock()
    
    var body: some Scene {
        MenuBarExtra {
            FormView()
                .environment(tock)
        } label: {
            BarView()
                .environment(tock)
        }
        .menuBarExtraStyle(.window)

    }
}
