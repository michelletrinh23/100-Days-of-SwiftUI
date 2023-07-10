//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Michelle Trinh on 7/7/23.
//

import SwiftUI

struct Titles: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .background(.yellow)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Titles())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hacking with Swift!")
            .frame(width: 300, height: 100)
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
