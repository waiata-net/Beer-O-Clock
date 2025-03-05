//
//  TockView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import SwiftUI

struct TockView: View {
    
    
    @Environment(Beer.self) var beer: Beer
    
    let formatter = RelativeDateTimeFormatter()
    
    var body: some View {
        VStack {
        Text(beer.last?.title ?? "")
            PintView()
                .frame(minHeight: 180)
            
            if let next = beer.next {
                let until = next.title
                let togo = formatter.localizedString(for: next.time.future, relativeTo: .now)
                Text(until + " " + togo)
            }
        }
        .font(.largeTitle)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    TockView()
        .environment(Beer())
}
