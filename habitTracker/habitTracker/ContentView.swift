//
//  ContentView.swift
//  habitTracker
//
//  Created by Michelle Trinh on 10/18/23.
//

import SwiftUI

struct activityStruct: Codable, Identifiable, Equatable, Hashable {
    var id: UUID
    var title: String
    var description: String
    var completionCount: Int
}

class activityTitles: ObservableObject {
    @Published var activities: [activityStruct] = []
}

struct ContentView: View {
    
    @State private var habitTitle: String = ""
    @State private var habitDescription: String = ""
    @StateObject private var data = activityTitles()
    //@State private var habitTitleDescription: [String:String] = [:]
    //@State private var habitMenu: [String] = []
    //var helper: String { return "\(habitMenu)" }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Text("Add a Habit")
                        
                        TextField("Type activity here", text: $habitTitle)
                        TextField("Type activity description here", text: $habitDescription)
                        
                        Button("Click to add activity") {
                            let newActivity = activityStruct(id: UUID(), title: habitTitle, description: habitDescription, completionCount: 0)
                            data.activities.append(newActivity)
                            habitTitle = ""
                            habitDescription = ""
                        }
                        
                    }
                    
                    
                    Text("Habit Menu")
                    
                    ForEach(data.activities, id: \.self) { activity in
                        NavigationLink(destination: DetailContentView(title: activity.title, description: activity.description)) {
                            Text(activity.title)
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
