//
//  TockView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import SwiftUI

struct TockView: View {
    
    
    @Environment(Tock.self) var tock: Tock
    
    var body: some View {
        if let remaining = tock.remaining {
            Text(remaining.hhmm + " Remaining")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
        } else {
            Text("Beer O'Clock!")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    TockView()
        .environment(Tock())
}
