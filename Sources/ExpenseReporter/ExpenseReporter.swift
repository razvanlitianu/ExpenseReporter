//
//  ExpenseReport.swift
//
//
//  Created by Razvan on 26.07.2022.
//
import Foundation

public class ExpenseReport {
    private var expenses: [ExpenseType] = []

    public func printReport(_ printer: ReportPrinter) {
        var total: Double = 0
        var mealExpenses: Double = 0

        printer.print("Expenses " + date + "\n")

        for expense in expenses {
            if (expense is BreakfastExpense || expense is DinnerExpense) {
                mealExpenses += expense.amount
            }

            var name = "TILT"
            switch expense {
            case is DinnerExpense: name = "Dinner"
            case is BreakfastExpense: name = "Breakfast"
            case is CarRentalExpense: name = "Car Rental"
            default: name = "TILT"
            }
            printer.print(String(format: "%@\t%@\t$%.02f\n",
                                 ((expense is DinnerExpense && expense.amount > 5000)
                                    || (expense is BreakfastExpense && expense.amount > 1000)) ? "X" : " ",
                                 name, expense.amount / 100.0))

            total += expense.amount
        }

        printer.print(String(format: "\nMeal expenses $%.02f", mealExpenses / 100.0))
        printer.print(String(format: "\nTotal $%.02f", total / 100.0))
    }

    public func add(expense: ExpenseType) {
        expenses.append(expense)
    }

    private var date: String { "9/12/2002" }
}
