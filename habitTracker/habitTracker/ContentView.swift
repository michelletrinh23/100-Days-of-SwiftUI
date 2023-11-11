//
//  ContentView.swift
//  habitTracker
//
//  Created by Michelle Trinh on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var habitTitle: String = ""
    @State private var habitDescription: String = ""
    @State private var habitTitleDescription: [String:String] = [:]
    var helper: String { return "\(addedHabits)" }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("What activity would you like to track?")
                    
                    TextField("Type activity here", text: $habitTitle)
                    TextField("Type activity description here", text: $habitDescription)
                    
                    Button("Add Habit") {
                        habitTitleDescription[habitTitle] = habitDescription
                        habitTitle = ""
                        habitDescription = ""
                    }
                    
                    Text("Activities: \(habitTitleDescription.description)")
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
