//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Michelle Trinh on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
            
            Text("Tertiary")
        }
    }
}


#Preview {
    ContentView()
}
