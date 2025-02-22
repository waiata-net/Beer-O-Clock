//
//  BarView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import SwiftUI

struct BarView: View {
    
    @AppStorage("Work Time") var workTime = Time(hour: 9)
    @AppStorage("Beer Time") var beerTime = Time(hour: 17)
    
    @State var image: NSImage?
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

    var body: some View {
        if let image {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
                    .onReceive(timer) { _ in
                        render()
                    }
                    .onChange(of: workTime) { oldValue, newValue in
                        render()
                    }
                    .onChange(of: beerTime) { oldValue, newValue in
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
        let renderer = ImageRenderer(content: PintView())
        renderer.scale = NSScreen.main?.backingScaleFactor ?? 2.0
        if let image = renderer.nsImage {
            self.image = image
        }
    }
    
}

#Preview {
    BarView()
}
