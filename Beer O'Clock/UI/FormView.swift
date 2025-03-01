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
        @Bindable var tock = tock
        ScrollView {
            TockView()
            Section {
                ForEach(tock.ticks.ticks.indices, id: \.self) { i in
                    TickView(tick: $tock.ticks.ticks[i])
                }
            }
            .padding()
            Form {
                Section {
                    LoginLaunchButt()
                    QuitButt()
                }
            }
            .formStyle(.grouped)
        }
        .frame(minWidth: 360)
        
    }
}

#Preview {
    FormView()
        .environment(Tock())
}
