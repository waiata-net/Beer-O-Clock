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
        VStack {
//        Text(tock.last?.title ?? "")
            
            PintView()
                .frame(minHeight: 120)
            
//            if let next = tock.next?.title,
//               let hhmm = tock.remaining?.hhmm {
//                Text(hhmm + " until " + next)
//            }
        }
        .font(.largeTitle)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    TockView()
        .environment(Tock())
}
