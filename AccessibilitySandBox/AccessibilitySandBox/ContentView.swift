//
//  ContentView.swift
//  AccessibilitySandBox
//
//  Created by Michelle Trinh on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .ignore)
            //parameter for accessibilityElement can be empty, will still be considered as .ignore
            .accessibilityLabel("Your score is 1000")
        }
    }
}

#Preview {
    ContentView()
}
