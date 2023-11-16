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
                        Text("Add a Habit")
                        
                        TextField("Type activity here", text: $habitTitle)
                        TextField("Type activity description here", text: $habitDescription)
                        
                        Button("Click to add activity") {
                            habitTitleDescription[habitTitle] = habitDescription
                            habitMenu.append(habitTitle)
                            habitTitle = ""
                            habitDescription = ""
                            
                        }
                        
                    }
                    
                    
                    
                    Text("All Activities: \(helper)")
                    
                    
                    Text("Habit Menu")
                    
                    ForEach(habitMenu, id: \.self) { title in
                        NavigationLink(destination: DetailContentView(title: title, description: habitTitleDescription[title] ?? "")) {
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

struct DetailContentView: View {
    var title: String
    var description: String

    var body: some View {
        Text("Description of habit: \(description)")
            .navigationTitle("Habit: \(title)")
    }
}

#Preview {
    ContentView()
}
