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
        Image(systemName: "rock")
            .imageScale(.large)
            .foregroundStyle(.tint)
        
        Image(systemName: "paper")
            .imageScale(.large)
            .foregroundStyle(.tint)
        
        Image(systemName: "scissors")
            .imageScale(.large)
            .foregroundStyle(.tint)
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
            
            Text("Make your Choice")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
            
            VStack(spacing: 15){
                ForEach(0..<3) { number in
                    Button {
                        choiceTapped(number)
                    } label: {
                        ChoiceImage(choice: choices[number])
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Spacer()
        }
        .padding()
    }
    
    func choiceTapped(_ number: Int) {
        tapCounter += 1
        
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
