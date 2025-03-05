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
        ScrollView {
            TockView()
                .padding()
            ForEach(beer.tock.ticks.indices, id: \.self) { i in
                TickView(tick: $beer.tock.ticks[i])
                    .padding(.horizontal)
            }
            
            GroupBox {
                VStack {
                    VesselPick(vessel: $beer.tock.vessel)
                    LiquidPick(liquid: $beer.tock.liquid)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .padding()
            
            GroupBox {
                VStack {
                    LoginLaunchButt()
                    QuitButt()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .frame(minWidth: 360, minHeight: 480)
    }
}


#Preview {
    FormView()
        .environment(Beer())
        .frame(minHeight: 960)
}
