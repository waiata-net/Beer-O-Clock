//
//  Beer_O_ClockApp.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

@main
struct Beer_O_ClockApp: App {
    
    @State var beer = Beer()
    @State var brolly = Brolly()
    
    var body: some Scene {
        MenuBarExtra {
            FormView()
                .environment(beer)
                .environment(brolly)
        } label: {
            BarView()
                .environment(beer)
                .environment(brolly)
        }
        .menuBarExtraStyle(.window)
    }
}

#Preview{
    BarView()
        .environment(Beer())
        .frame(width: 360, height: 24)
    FormView()
        .environment(Beer())
}
