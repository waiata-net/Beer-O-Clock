//
//  LiquidPick.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 05/03/2025.
//

import SwiftUI

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

#Preview {
    @Previewable @State var liquid = Liquid.allCases.randomElement()!
    LiquidPick(liquid: $liquid)
}
