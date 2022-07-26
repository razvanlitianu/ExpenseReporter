//
//  ExpenseReport.swift
//  
//
//  Created by Razvan on 26.07.2022.
//

import Foundation

public class ExpenseReport {
    public private(set) var expenses: [ExpenseType] = []
    var total: Double = 0
    var mealExpenses: Double = 0

    fileprivate func addToTotal(_ expense: ExpenseType) {
        if expense.isMeal {
            mealExpenses += expense.amount
        }
        total += expense.amount
    }

    public func totalUpExpenses() {
        for expense in expenses {
            addToTotal(expense)
        }
    }

    public func add(expense: ExpenseType) {
        expenses.append(expense)
    }
}
