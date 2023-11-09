//
//  ContentView.swift
//  habitTracker
//
//  Created by Michelle Trinh on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var habit: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("What activity would you like to track?")
                    
                    TextField("Type activity here", text: $habit)
                }
                .padding()
            }
            .navigationTitle("Habit Tracker")
        }
    }
}

#Preview {
    ContentView()
}
