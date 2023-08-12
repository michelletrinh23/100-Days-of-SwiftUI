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
        
        path.move(to: CGPoint(x: 250, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 100))
        path.move(to: CGPoint(x: 200, y: 50))
        path.addLine(to: CGPoint(x: 200, y: 150))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var verticalStart: Double
    var horizontalStart: Double
    var verticalEnd: Double
    var horizontalEnd: Double
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: UnitPoint(x: horizontalStart, y: verticalStart),
                            endPoint: UnitPoint(x: horizontalEnd, y: verticalEnd)
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct ContentView: View {
    @State private var arrowWidth = 5.0
    @State private var colorCycle = 0.0
    @State private var vertical = 0.0
    @State private var horizontal = 0.0
    
    @State var verticalStart = 0.0
    @State var horizontalStart = 0.0
    @State var verticalEnd = 0.0
    @State var horizontalEnd = 0.0

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
            
            Divider()
        ScrollView {
            VStack {
                ColorCyclingRectangle(amount: colorCycle, verticalStart: verticalStart, horizontalStart: horizontalStart, verticalEnd: verticalEnd, horizontalEnd: horizontalEnd)
                    .frame(width: 300, height: 300)
                    .padding()
                
                Text("Color cycle slider!")
                Slider(value: $colorCycle)
                Text("Where should the gradient start?")
                HStack {
                    Text("X-Axis")
                    Slider(value: $horizontalStart)
                }
                HStack {
                    Text("Y-Axis")
                    Slider(value: $verticalStart)
                }
                Text("Where should the gradient end?")
                HStack {
                    Text("X-Axis")
                    Slider(value: $horizontalEnd)
                }
                HStack {
                    Text("Y-Axis")
                    Slider(value: $verticalEnd)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
 
