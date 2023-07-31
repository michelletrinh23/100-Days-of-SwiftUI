//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Michelle Trinh on 7/31/23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
