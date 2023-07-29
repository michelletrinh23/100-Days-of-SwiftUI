//
//  ContentView.swift
//  MathIsFun
//
//  Created by Michelle Trinh on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var questionAmount = 5
    @State private var currentRow = 1
    @State private var currentColumn = 1
    @State private var upToWhat = 1
    
    @State private var showIntroQuestions = true
    @State private var showGame = false
    @State private var tapCounter = 0
    
    @State private var answerOptions = Array(0...144)
    @State private var correctAnswer = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var gameOver = false
    @State private var gameState = ""
    
    var body: some View {
        VStack {
            
            Text("Let's Multiply!")
                .font(.largeTitle.bold())
                .foregroundColor(.blue)
            
            VStack {
                if showIntroQuestions == true {
                    Text("How many questions do you want to do?")
                    HStack {
                        Picker("Choose an amount of questions", selection: $questionAmount) {
                            ForEach([5, 10, 20], id: \.self) {
                                Text(String($0))
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .frame(width: 200)
                    
                    
                    Text("What multiplication table do you want to go up to?")
                    
                    Picker("Choose maximum multiplication table", selection: $upToWhat) {
                        ForEach(1...12, id: \.self) { number in
                            Text(String(number))
                        }
                    }
                    
                    Button("Start Game") {
                        showIntroQuestions = false
                        showGame = true
                    }
                }
            }
            
            VStack(spacing: 15) {
                if showGame == true {
                    VStack {
                        
                        Text("What is...")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text("\(currentRow) x \(currentColumn) ?")
                    }
                    
                    VStack {
                        ForEach(0..<3) { number in
                            Button {
                                choiceTapped(answerOptions[number])
                            } label: {
                                Text(String(answerOptions[number]))
                            }
                        }
                        
                        Button {
                            choiceTapped(currentRow * currentColumn)
                        }  label: {
                            Text(String(currentRow * currentColumn))
                        }
                    }
                
                    .padding()
                    
                    Text("\(scoreTitle)")
                        .foregroundColor(.primary)
                    Text("Score: \(userScore)")
                        .foregroundColor(.primary)
                        .font(.title.bold())
                }
            }
            
        }
        .onAppear {
            generateRandomQuestion(upTo: questionAmount)
        }
        .padding()
        .alert(gameState, isPresented: $gameOver) {
            Button("Start Over", action: restartGame)
        } message: {
            Text("Game Over! Your final score is \(userScore)")
        }
    }
    
    func choiceTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            userScore += 1
        } else {
            scoreTitle = "Wrong!"
            userScore -= 1
        }
        
        showingScore = true
        answerOptions.shuffle()
        tapCounter += 1
        generateRandomQuestion(upTo: questionAmount)
        
        if tapCounter >= questionAmount {
                    gameOver = true
                    gameState = "Game Over"
                }
    }
    
    func generateRandomQuestion(upTo: Int) {
        currentRow = Int.random(in: 1...upToWhat)
        currentColumn = Int.random(in: 1...12)
        correctAnswer = currentRow * currentColumn
    }
    
    func restartGame() {
            tapCounter = 0
            userScore = 0
            gameOver = false
            gameState = ""
            generateRandomQuestion(upTo: upToWhat)
            showIntroQuestions = true
            showGame = false
            questionAmount = 5
            upToWhat = 1
        
        }
}


#Preview {
    ContentView()
}
