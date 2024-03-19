//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Michelle Trinh on 3/19/24.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
            .alert("Welcome", isPresented: $isShowingUser) { }
    }
}

#Preview {
    ContentView()
}
