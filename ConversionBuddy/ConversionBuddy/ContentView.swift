//
//  ContentView.swift
//  ConversionBuddy
//
//  Created by Michelle Trinh on 7/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var unitbegin = "Celsius"
    @State private var unitend = "Celsius"
    @State private var amountEntered = 0.0
    @State private var amountConverted = 0.0
    @FocusState private var amountIsFocused: Bool
    
    var conversion: Double {
        let celsiusToFahrenheit = (amountEntered * (9/5)) + 32.0
        let celsiusToKelvin = amountEntered + 273.15
        let fahrenheitToCelsius = (amountEntered - 32.0) * (5/9)
        let fahrenheitToKelvin = ((amountEntered - 32.0) * (5/9)) + 273.15
        let kelvinToCelsius = amountEntered - 273.15
        let kelvinToFahrenheit = ((amountEntered - 273.15) * (9/5)) + 32
      
        if unitbegin == unitend {
            return amountEntered
        }
        else if unitbegin == "Celsius" && unitend == "Fahrenheit" {
            return celsiusToFahrenheit
        }
        else if unitbegin == "Celsius" && unitend == "Kelvin" {
            return celsiusToKelvin
        }
        else if unitbegin == "Fahrenheit" && unitend == "Celsius" {
            return fahrenheitToCelsius
        }
        else if unitbegin == "Fahrenheit" && unitend == "Kelvin" {
            return fahrenheitToKelvin
        }
        else if unitbegin == "Kelvin" && unitend == "Celsius" {
            return kelvinToCelsius
        }
        else if unitbegin == "Kelvin" && unitend == "Fahrenheit" {
            return kelvinToFahrenheit
        }
        else {
            return 0
        }
    }
    
    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("What unit are you converting from?")) {
                        Picker("Unit to convert from", selection: $unitbegin) {
                            ForEach(["Celsius", "Fahrenheit", "Kelvin"], id: \.self) {
                                Text(String($0))
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Section(header: Text("Enter amount here")) {
                        TextField("Amount", value: $amountEntered, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                
                    Section(header: Text("What unit are you converting to?")) {
                        Picker("Unit to convert to", selection: $unitend) {
                            ForEach(["Celsius", "Fahrenheit", "Kelvin"], id: \.self) {
                                Text(String($0))
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Section(header: Text("Converted amount")) {
                        Text(conversion, format: .number)
                    }
            }
            .navigationTitle("ConversionBuddy")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
