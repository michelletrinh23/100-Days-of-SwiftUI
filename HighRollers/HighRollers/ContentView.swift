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
                }
            }
            .navigationTitle("High Rollers")
        }
    }
    
    func rollDice() {

    }
}

#Preview {
    ContentView()
}
