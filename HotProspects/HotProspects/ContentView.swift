//
//  ContentView.swift
//  HotProspects
//
//  Created by Michelle Trinh on 1/19/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {

    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
