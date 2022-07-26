//
//  Expense.swift
//  
//
//  Created by Razvan on 26.07.2022.
//

public protocol ExpenseType {
    var amount: Double { get set }
    var isOverage: Bool { get }
    var isMeal: Bool { get }
}

public struct DinnerExpense: ExpenseType {
    public var amount: Double

    public var isOverage: Bool { amount > 5000 }
    public var isMeal: Bool { true }
}

public struct BreakfastExpense: ExpenseType {
    public var amount: Double

    public var isOverage: Bool { amount > 1000 }
    public var isMeal: Bool { true }
}

public struct CarRentalExpense: ExpenseType {
    public var amount: Double

    public var isOverage: Bool { false }
    public var isMeal: Bool { false }
}
