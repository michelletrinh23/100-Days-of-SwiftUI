//
//  ContentView.swift
//  HighRollers
//
//  Created by Michelle Trinh on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]

    @AppStorage("selectedDiceType") var selectedDiceType = 6
    @AppStorage("numberToRoll") var numberToRoll = 4
    
    @State private var currentResult = DiceResult(type: 0, number: 0)
    
    let columns: [GridItem] = [
        .init(.adaptive(minimum: 60))
    ]

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Type of dice", selection: $selectedDiceType) {
                        ForEach(diceTypes, id: \.self) { type in
                            Text("D\(type)")
                        }
                    }
                    .pickerStyle(.segmented)

                    Stepper("Number of dice: \(numberToRoll)", value: $numberToRoll, in: 1...20)

                    Button("Roll them!", action: rollDice)
                } footer: {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<currentResult.rolls.count, id: \.self) { rollNumber in
                            Text(String(currentResult.rolls[rollNumber]))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundStyle(.black)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 3)
                                .font(.title)
                                .padding(5)
                        }
                    }
                }
            }
            .navigationTitle("High Rollers")
        }
    }
    
    func rollDice() {
        currentResult = DiceResult(type: selectedDiceType, number: numberToRoll)
    }
}

#Preview {
    ContentView()
}
