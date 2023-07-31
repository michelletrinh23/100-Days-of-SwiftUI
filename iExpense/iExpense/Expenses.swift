//
//  Expenses.swift
//  iExpense
//
//  Created by Michelle Trinh on 7/31/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
