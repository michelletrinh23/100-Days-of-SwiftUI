//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Michelle Trinh on 7/31/23.
//
import SwiftUI
import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double


    var color: Color {
            if amount < 10 {
                return .green
            } else if amount < 100 {
                return .yellow
            } else {
                return .red
            }
    }
}

