//
//  ContentView.swift
//  iExpense
//
//  Created by Michelle Trinh on 7/31/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject var user = User()
//when creating object, use stateObject
//when using object elsewhere, use environmentObject
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

#Preview {
    ContentView()
}
