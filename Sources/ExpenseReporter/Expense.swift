//
//  Expense.swift
//  
//
//  Created by Razvan on 26.07.2022.
//

public class Expense {
    public enum ExpenseType {
        case dinner
        case breakfast
        case carRental
    }

    public let type: ExpenseType
    public let amount: Double

    init(type: Expense.ExpenseType, amount: Double) {
        self.type = type
        self.amount = amount
    }
}
