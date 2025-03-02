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
        Form {
            ForEach(tock.ticks.ticks.indices, id: \.self) { i in
                TickView(tick: $tock.ticks.ticks[i])
            }
            TockView()
            Divider()
            QuitButt()
            
        }
        .formStyle(.automatic)
        .frame(minWidth: 360)
        .padding()
    }
}

#Preview {
    FormView()
        .environment(Tock())
}
