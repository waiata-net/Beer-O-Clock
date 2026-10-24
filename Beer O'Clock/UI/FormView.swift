//
//  FormView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct FormView: View {

    @Environment(Beer.self) var beer: Beer

    var body: some View {
        @Bindable var beer = beer
        Form {
            TockView()
                .padding()
            Section("Daily") {
                DailySets()
            }

            Section("Drink") {
                DrinkSets()
            }

            Section("Location") {
                BrollySets()
            }

            Section("Update") {
                //                UpdateSets()
            }

            Section("App") {
                LoginLaunchButt()
                QuitButt()
            }
        }
        .formStyle(.grouped)
        .frame(minWidth: 360, maxWidth: .infinity, minHeight: 480)

    }
}

#Preview {
    FormView()
        .environment(Beer())
        .frame(minHeight: 960)
}
