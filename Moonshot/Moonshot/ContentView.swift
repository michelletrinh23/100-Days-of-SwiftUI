//
//  ContentView.swift
//  Moonshot
//
//  Created by Michelle Trinh on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")

    var body: some View {
        Text("\(astronauts.count)")
        .padding()
    }
}

#Preview {
    ContentView()
}
