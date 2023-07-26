//
//  ContentView.swift
//  WordScramble
//
//  Created by Michelle Trinh on 7/25/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
    }
}

#Preview {
    ContentView()
}
