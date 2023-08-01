//
//  ContentView.swift
//  iExpense
//
//  Created by Michelle Trinh on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var currencyChoices = [
        "USD",
        "EUR",
        "JPY",
        "GBP",
        "AUD",
        "CAD",
        "CHF",
        "CNY",
        "SEK",
        "NZD"
    ]
    @State private var currency = "USD"
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Currency", selection: $currency) {
                    ForEach(currencyChoices, id: \.self) { currencyCode in
                        Text(currencyCode)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
     
                List {
                    Text("Personal")
                        .foregroundColor(.blue)
                        .bold()
                        .font(.title)
                    
                    ForEach(personalExpenses) { item in
                        ExpenseRow(item: item, currency: currency)
                    }
                    .onDelete(perform: removeItems)
                }
                
                List {
                    Text("Business")
                        .foregroundColor(.blue)
                        .bold()
                        .font(.title)
                    
                    ForEach(businessExpenses) { item in
                        ExpenseRow(item: item, currency: currency)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ExpenseRow: View {
    var item: ExpenseItem
    var currency: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
            }

            Spacer()

            Text(item.amount, format: .currency(code: currency))
        }
        .foregroundColor(item.color)
    }
}


#Preview {
    ContentView()
}
