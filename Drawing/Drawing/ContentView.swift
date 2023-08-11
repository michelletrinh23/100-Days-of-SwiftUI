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

    var body: some View {
        Arrow()
            .stroke()
    }
}


#Preview {
    ContentView()
}
