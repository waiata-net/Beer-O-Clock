//
//  FormView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct FormView: View {
    
    @Environment(Tock.self) var tock: Tock
    
    var body: some View {
        Form {
            Section("Times") {
                @Bindable var tock = tock
                TimeField(label: "Start Work:", time: $tock.times.work)
                TimeField(label: "Beer O'Clock:", time: $tock.times.beer)
            }
            Section("Progress") {
                TockView()
                PintView()
                    .frame(minHeight: 120)
            }
                QuitButt()
                
        }
        .formStyle(.grouped)
        .frame(minWidth: 360)
        .padding()
    }
}

#Preview {
    FormView()
        .environment(Tock())
}
