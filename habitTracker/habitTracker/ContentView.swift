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
    @State private var habitMenu: [String] = []
    var helper: String { return "\(habitMenu)" }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Text("What activity would you like to track?")
                        
                        TextField("Type activity here", text: $habitTitle)
                        TextField("Type activity description here", text: $habitDescription)
                        
                        Button("Add Habit") {
                            habitTitleDescription[habitTitle] = habitDescription
                            habitMenu.append(habitTitle)
                            habitTitle = ""
                            habitDescription = ""
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                    Text("Activities: \(helper)")
                    
                    ForEach(habitMenu, id: \.self) { title in
                        Button {
                           //what happens when the button is pressed
                        } label: {
                           Text(title)
                        }
                    }
                
                    
                    .padding()
                }
            }
            .navigationTitle("Habit Tracker")
        }
    }
}

#Preview {
    ContentView()
}
