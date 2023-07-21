//
//  ContentView.swift
//  BetterRest
//
//  Created by Michelle Trinh on 7/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now

    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
    }
    
    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
    }
    
}

#Preview {
    ContentView()
}
