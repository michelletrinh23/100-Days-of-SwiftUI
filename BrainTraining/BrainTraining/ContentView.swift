//
//  ContentView.swift
//  BrainTraining
//
//  Created by Michelle Trinh on 7/11/23.
//

import SwiftUI

struct ChoiceImage: View {
    var choice: String
    
    var body: some View {
        switch choice {
            case "Rock":
                Text("🪨")
                    .foregroundStyle(.tint)
                    .shadow(radius: 5)
            case "Paper":
                Text("📄")
                    .foregroundStyle(.tint)
                    .shadow(radius: 5)
            case "Scissors":
                Text("✂️")
                    .foregroundStyle(.tint)
                    .shadow(radius: 5)
        default:
            EmptyView()
        }
    }
}

struct ContentView: View {
    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var opponent = ["Rock", "Paper", "Scissors"]
    @State private var tapCounter = 0
    @State private var gameOver = false
    @State private var gameState = ""
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var showingScore = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Rock, Paper, or Scissors?")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
            
            VStack(spacing: 15){
                VStack {
                    Text("Make Your Choice")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text("Win this time")
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3) { number in
                    Button {
                        choiceTapped(number)
                    } label: {
                        ChoiceImage(choice: choices[number])
                    }
                }
            }
            .frame(maxWidth: 350)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            Spacer()
        }
        .padding()
    }
    
    func choiceTapped(_ number: Int) {
        tapCounter += 1
        
        let opponentChoice = choices[Int.random(in: 0..<3)]
        
        if number == correctAnswer {
            scoreTitle = "Correct! Congratulations!"
            userScore += 1
        } else {
            scoreTitle = "Wrong! You should have chosen \(choices[number]) "
            userScore -= 1
        }
        
        showingScore = true
        
        
        
        if tapCounter >= 10 {
                    gameOver = true
                    gameState = "Game Over"
                }
    }
    
}


#Preview {
    ContentView()
}
