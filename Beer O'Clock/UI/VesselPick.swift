//
//  VesselPick.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 05/03/2025.
//

import SwiftUI

struct VesselPick: View {
    
    @Binding var vessel: Vessel
    
    var body: some View {
        Picker(selection: $vessel) {
            ForEach(Vessel.allCases, id: \.self) {
                Text($0.title)
                    .tag($0)
            }
        } label: {
            Text("Vessel:")
        }

    }
}

#Preview {
    @Previewable @State var vessel = Vessel.allCases.randomElement()!
    VesselPick(vessel: $vessel)
}
