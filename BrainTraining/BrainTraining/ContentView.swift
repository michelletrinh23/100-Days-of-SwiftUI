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
                    .font(.system(size: 120))
                    .foregroundStyle(.tint)
                    .shadow(radius: 5)
            case "Paper":
                Text("📄")
                    .font(.system(size: 120))
                    .foregroundStyle(.tint)
                    .shadow(radius: 5)
            case "Scissors":
                Text("✂️")
                    .font(.system(size: 120))
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
    @State private var winObjective = true
    var body: some View {
        VStack {
            Spacer()
            
            Text("Rock, Paper, or Scissors?")
                .font(.largeTitle.bold())
                .foregroundColor(.primary)
            
            VStack(spacing: 15){
                VStack {
                    Text("Make Your Choice")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
    
                    Text(winObjective ? "Win this time" : "Lose this time")
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
            Spacer()
            
            Text("Score: \(userScore)")
                .foregroundColor(.primary)
                .font(.title.bold())
            
            Spacer()
            
            if showingScore {
                Text(scoreTitle)
            }
        }
        .padding()
        .alert(gameState, isPresented: $gameOver) {
            Button("Start Over", action: restartGame)
        } message: {
            Text("Game Over! Your final score is \(userScore)")
        }
    }
        
    
    func choiceTapped(_ number: Int) {
        tapCounter += 1
        
        let opponentChoice = choices[Int.random(in: 0..<3)]
        
        if winObjective {
            if (number == 0 && opponentChoice == "Rock") ||
                (number == 1 && opponentChoice == "Paper") ||
                (number == 2 && opponentChoice == "Scissors") {
                scoreTitle = "Opponent chose \(opponentChoice). It's a tie!"
                userScore += 1
            } else if (number == 0 && opponentChoice == "Scissors") ||
                   (number == 1 && opponentChoice == "Rock") ||
                   (number == 2 && opponentChoice == "Paper") {
                    scoreTitle = "Opponent chose \(opponentChoice). You are correct! Congratulations!"
                    userScore += 1
                } else {
                    scoreTitle = "Opponent chose \(opponentChoice). You chose wrong!"
                    userScore -= 1
                }
            } else {
                if (number == 0 && opponentChoice == "Rock") ||
                    (number == 1 && opponentChoice == "Paper") ||
                    (number == 2 && opponentChoice == "Scissors") {
                    scoreTitle = "Opponent chose \(opponentChoice). It's a tie!"
                    userScore += 1
                } else if (number == 0 && opponentChoice == "Paper") ||
                   (number == 1 && opponentChoice == "Scissors") ||
                   (number == 2 && opponentChoice == "Rock") {
                    scoreTitle = "Opponent chose \(opponentChoice). You are correct! Congratulations!"
                    userScore += 1
                } else {
                    scoreTitle = "Opponent chose \(opponentChoice). You chose wrong!"
                    userScore -= 1
                }
            }
        
        showingScore = true
        
        winObjective.toggle()
        
        if tapCounter >= 10 {
                    gameOver = true
                    gameState = "Game Over"
                }
    }
    
    func askQuestion() {
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
            tapCounter = 0
            userScore = 0
            gameOver = false
            gameState = ""
            askQuestion()
            scoreTitle = ""
        }
}


#Preview {
    ContentView()
}
