//
//  ContentView.swift
//  Instafilter
//
//  Created by Michelle Trinh on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let example = Image(.example)

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}
