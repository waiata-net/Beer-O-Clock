//
//  SoundPick.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 23/02/2025.
//

import SwiftUI

struct SoundPick: View {
    
    @Binding var sound: String
    
    var bundledSounds: [URL] {
        Bundle.main.urls(forResourcesWithExtension: "aif", subdirectory: nil) ?? []
    }
    
    var body: some View {
        Picker(selection: $sound) {
            Text("System Default").tag("")
            Divider()
            ForEach(bundledSounds, id: \.absoluteString) { url in
                Text(url.deletingPathExtension().lastPathComponent).tag(url.lastPathComponent)
            }
            Divider()
        } label: {
            Label("Sound", systemImage: "speaker.wave.2.fill")
        }
        .labelStyle(.iconOnly)
    }
}

#Preview {
    @Previewable @State var sound = "Beer.aif"
    SoundPick(sound: $sound)
}
