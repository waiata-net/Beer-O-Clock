//
//  DrinkSets.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 24/10/2026.
//

import SwiftUI

struct DrinkSets: View {
    
    @Environment(Beer.self) var beer: Beer
    
    var body: some View {
        
        @Bindable var beer = beer
        
        VesselPick(vessel: $beer.tock.vessel)
        LiquidPick(liquid: $beer.tock.liquid)
    }
    
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
    
    struct LiquidPick: View {
        
        @Binding var liquid: Liquid
        
        var body: some View {
            Picker(selection: $liquid) {
                ForEach(Liquid.allCases, id: \.self) {
                    Text($0.title)
                        .tag($0)
                }
            } label: {
                Text("Liquid:")
            }

        }
    }
}

#Preview {
    DrinkSets()
        .environment(Beer())
}
