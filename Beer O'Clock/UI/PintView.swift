//
//  PintView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct PintView: View {
    
    @Environment(Tock.self) var tock: Tock
    
    var body: some View {
        LinearGradient(stops: stops, startPoint: bot, endPoint: top)
            .mask(Image(.beer)
                .resizable()
                .scaledToFit())
            .overlay {
                Image(.glass)
                    .resizable()
                    .scaledToFit()
            }
            .frame(minWidth: 24, minHeight: 24)
            
    }
    
    let bot = UnitPoint(x: 0, y: 1)
    var top: UnitPoint {
        UnitPoint(x: 0, y: 1 - tock.phase)
    }
    
    let stops: [Gradient.Stop] = [
        Gradient.Stop(color: .amber, location: 0),
        Gradient.Stop(color: .amber, location: 0.69),
        Gradient.Stop(color: .head, location: 0.88),
        Gradient.Stop(color: .clear, location: 1)
    ]
    
}



#Preview {
    PintView()
        .environment(Tock())
}
