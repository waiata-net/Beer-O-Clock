//
//  BarView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 22/02/2025.
//

import SwiftUI

struct BarView: View {
    
    @Environment(Tock.self) var tock: Tock
    
    @State var image: NSImage?

    var body: some View {
        if let image {
            Image(nsImage: image)
                .resizable()
                .scaledToFit()
                .onChange(of: tock.phase) { _, _ in
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
        let renderer = ImageRenderer(content: PintView().environment(tock))
        renderer.scale = NSScreen.main?.backingScaleFactor ?? 2.0
        if let image = renderer.nsImage {
            self.image = image
        }
    }
    
}

#Preview {
    BarView()
        .environment(Tock())
}
