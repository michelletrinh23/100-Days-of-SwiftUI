//
//  ContentView.swift
//  Drawing
//
//  Created by Michelle Trinh on 8/8/23.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 200, y: 150))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.move(to: CGPoint(x: 200, y: 150))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.move(to: CGPoint(x: 200, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 600))
        
        return path
    }
}

struct ContentView: View {
    @State private var arrowWidth = 5.0
    
    var body: some View {
        
        Text("Press on the arrow to receive a random arrow width!")
            .multilineTextAlignment(.center)
            .font(.title)
        Arrow()
            .stroke(lineWidth: CGFloat(arrowWidth))
            .onTapGesture {
                withAnimation {
                    arrowWidth = Double.random(in: 1...50)
                }
            }
        Text("Current arrow width: \(arrowWidth)")
    }
}


#Preview {
    ContentView()
}
