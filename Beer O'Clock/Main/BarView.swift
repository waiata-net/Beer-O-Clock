//
//  BarView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import SwiftUI

struct BarView: View {
    
    @Environment(Beer.self) var beer
    @Environment(Brolly.self) var brolly
    
    @State var pint: CGImage?
    
    var body: some View {
        if let weather = brolly.weather,
           weather.isRaining {
            Image("Umbrella")
                .resizable()
                .scaledToFit()
                .onChange(of: beer.phase) { _, _ in
                    render()
                }
        } else if let pint {
            Image(pint, scale: 1.0, orientation: .up, label: Text("Beer"))
                .resizable()
                .scaledToFit()
                .onChange(of: beer.phase) { _, _ in
                    render()
                }
        } else {
            Image(systemName: "wineglass")
                .onAppear() {
                    render()
                }
        }
    }
    
    func render() {
        let renderer = ImageRenderer(content: PintView().environment(beer))
        renderer.scale = NSScreen.main?.backingScaleFactor ?? 2.0
        if let image = renderer.cgImage {
            self.pint = image
        }
    }
    
        
}

#Preview {
    BarView()
        .environment(Beer())
        .environment(Brolly())
}
