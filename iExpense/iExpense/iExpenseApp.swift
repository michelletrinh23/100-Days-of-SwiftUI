//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Michelle Trinh on 7/31/23.
//
import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
