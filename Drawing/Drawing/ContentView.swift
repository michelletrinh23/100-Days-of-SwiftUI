//
//  ContentView.swift
//  Drawing
//
//  Created by Michelle Trinh on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0

    var body: some View {
        VStack {
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
