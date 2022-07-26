//
//  ExpenseReport.swift
//
//
//  Created by Razvan on 26.07.2022.
//
import Foundation

public class ExpenseReport {
    private var expenses: [Expense] = []

    public func printReport(_ printer: ReportPrinter) {
        var total: Double = 0
        var mealExpenses: Double = 0

        printer.print("Expenses " + date + "\n")

        for expense in expenses {
            if (expense.type == .breakfast || expense.type == .dinner) {
                mealExpenses += expense.amount
            }

            var name = "TILT"
            switch (expense.type) {
            case .dinner: name = "Dinner"
            case .breakfast: name = "Breakfast"
            case .carRental: name = "Car Rental"
            }
            printer.print(String(format: "%@\t%@\t$%.02f\n",
                                 ((expense.type == .dinner && expense.amount > 5000)
                                    || (expense.type == .breakfast && expense.amount > 1000)) ? "X" : " ",
                                 name, expense.amount / 100.0))

            total += expense.amount
        }

        printer.print(String(format: "\nMeal expenses $%.02f", mealExpenses / 100.0))
        printer.print(String(format: "\nTotal $%.02f", total / 100.0))
    }

    public func add(expense: Expense) {
        expenses.append(expense)
    }

    private var date: String { "9/12/2002" }
}
