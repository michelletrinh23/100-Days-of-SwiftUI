//
//  ContentView.swift
//  Animations
//
//  Created by Michelle Trinh on 7/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    
    var body: some View {
        Button("Tap Me") {
            //animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    ContentView()
}
