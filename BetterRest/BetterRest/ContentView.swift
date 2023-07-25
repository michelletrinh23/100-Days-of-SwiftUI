//
//  ContentView.swift
//  BetterRest
//
//  Created by Michelle Trinh on 7/21/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State var wakeUp = defaultWakeTime
    @State var sleepAmount = 8.0
    @State var coffeeAmount = 1
    
    @State var didChangeValues = false
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var idealBedtime = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    datePickView(date: $wakeUp, didChange: $didChangeValues)
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    customStepperView(amountToChange: $sleepAmount, didChange: $didChangeValues)
                }
                
                Section(header: Text("Daily coffee intake")) {
                    customPickerView(selection: $coffeeAmount, didChange: $didChangeValues)
                }
                
                Text("Your ideal bed time is \(idealBedtime)")
                    .foregroundColor(.primary)
                    .font(.title)
            }
            .navigationTitle("BetterRest")
            .onChange(of: didChangeValues) {
                calculateBedtime()
                didChangeValues = false
            }
            .onAppear{
                calculateBedtime()
            }
        }
    }
    
    struct datePickView: View {
        @Binding var date: Date
        @Binding var didChange: Bool
        
        var body: some View {
            DatePicker("Please enter a time", selection: $date, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .onChange(of: date) {
                    if !didChange{
                        didChange = true
                    }
                }
        }
    }
    
    struct customStepperView: View {
        @Binding var amountToChange: Double
        @Binding var didChange: Bool
        
        var body: some View {
            Stepper("\(amountToChange.formatted()) hours", value: $amountToChange, in: 4...12, step: 0.25)
                .onChange(of: amountToChange) {
                    if !didChange{
                        didChange = true
                    }
                }
        }
    }
    
    struct customPickerView: View {
        @Binding var selection: Int
        @Binding var didChange: Bool
        
        var body: some View {
            Picker("Number of cups", selection: $selection) {
                ForEach(1...20, id: \.self) { cup in
                    Text("\(cup) cup\(cup > 1 ? "s" : "")")
                }
            }
            .onChange(of: selection) {
                if !didChange{
                    didChange = true
                }
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))

            let sleepTime = wakeUp - prediction.actualSleep
          
            idealBedtime = sleepTime.formatted(date: .omitted, time: .shortened)
            
       } catch {
           idealBedtime = "Error calculating bedtime"
       }
    }
}
    


#Preview {
    ContentView()
}
