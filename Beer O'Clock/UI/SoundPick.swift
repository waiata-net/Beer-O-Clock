//
//  SoundPick.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 23/02/2025.
//

import SwiftUI

struct SoundPick: View {
    
    @Binding var sound: String
    
    func bundled(_ ext: String = "aif") -> [URL] {
        Bundle.main.urls(forResourcesWithExtension: ext, subdirectory: nil) ?? []
    }
    
    var bundledSounds: [URL] {
        bundled("aif") + bundled("caf")
    }
    
    var body: some View {
        Picker("", selection: $sound) {
            Text("System Default").tag("")
            Divider()
            ForEach(bundledSounds, id: \.absoluteString) { url in
                Text(url.deletingPathExtension().lastPathComponent).tag(url.lastPathComponent)
            }
            Divider()
        }
    }
}

#Preview {
    @Previewable @State var sound = "Beer.aif"
    SoundPick(sound: $sound)
}
