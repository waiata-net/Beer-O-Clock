//
//  FormView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct FormView: View {

    var body: some View {
        
        Form {
            
            BeerView()
            BrollyView()
        
            
            Section("Daily") {
                DailySets()
            }

            Section("Drink") {
                DrinkSets()
            }

            Section("Location") {
                LocationSets()
            }

            Section("Update") {
                UpdateSets()
            }

            Section("App") {
                AppSets()
            }
        }
        .formStyle(.grouped)
        .frame(minWidth: 360, maxWidth: .infinity, minHeight: 480)

    }
}

#Preview {
    FormView()
        .environment(Beer())
        .environment(Brolly())
        .frame(minHeight: 960)
}
