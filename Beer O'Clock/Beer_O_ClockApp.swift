//
//  Beer_O_ClockApp.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

@main
struct Beer_O_ClockApp: App {
    var body: some Scene {
        MenuBarExtra {
            FormView()
        } label: {
            BarView()
        }
        .menuBarExtraStyle(.window)

    }
}
