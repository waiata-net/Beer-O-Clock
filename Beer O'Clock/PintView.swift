//
//  PintView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct PintView: View {
    
    @AppStorage("Work Time") var workTime = Time(hour: 9)
    @AppStorage("Beer Time") var beerTime = Time(hour: 17)
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

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
        UnitPoint(x: 0, y: 1 - progress)
    }
    
    var progress: CGFloat {
        guard elapsed.seconds > 0,
              duration.seconds > 0
        else { return 0 }
        return elapsed.seconds / duration.seconds
    }
    
    var elapsed: Time {
        Time() - workTime
    }
    
    var duration: Time {
        beerTime - workTime
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
}
