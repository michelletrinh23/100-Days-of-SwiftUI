//
//  ContentView.swift
//  Moonshot
//
//  Created by Michelle Trinh on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("miffy3")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    ContentView()
}
