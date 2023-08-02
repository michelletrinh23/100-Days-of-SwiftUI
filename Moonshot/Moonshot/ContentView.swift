//
//  ContentView.swift
//  Moonshot
//
//  Created by Michelle Trinh on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")


    var body: some View {
        Text("\(astronauts.count)")
        .padding()
    }
}

#Preview {
    ContentView()
}
