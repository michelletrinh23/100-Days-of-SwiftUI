//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Michelle Trinh on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)

            GeometryReader { proxy in
                Image(.alesKrivec15949)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    ContentView()
}
