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
    
    func test() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound

    }
}
#Preview {
    ContentView()
}
