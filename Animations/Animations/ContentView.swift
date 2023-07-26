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
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
       
    }
}

#Preview {
    ContentView()
}
