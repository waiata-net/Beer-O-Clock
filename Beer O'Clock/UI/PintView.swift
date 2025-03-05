//
//  PintView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct PintView: View {
    
    @Environment(Beer.self) var beer: Beer
    
    var body: some View {
        LinearGradient(stops: beer.tock.liquid.stops, startPoint: bot, endPoint: top)
            .mask(Image(beer.tock.vessel.fill)
                .resizable()
                .scaledToFit())
            .overlay {
                Image(beer.tock.vessel.glass)
                    .resizable()
                    .scaledToFit()
            }
            .frame(minWidth: 24, minHeight: 24)
            
    }
    
    let bot = UnitPoint(x: 0, y: 1)
    var top: UnitPoint {
        UnitPoint(x: 0, y: 1 - beer.phase)
    }
    
}



#Preview {
    PintView()
        .environment(Beer())
}
