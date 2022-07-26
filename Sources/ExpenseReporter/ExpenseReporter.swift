//
//  ExpenseReport.swift
//
//
//  Created by Razvan on 26.07.2022.
//
import Foundation

public class ExpenseReport {
    private var expenses: [ExpenseType] = []
    var total: Double = 0
    var mealExpenses: Double = 0

    fileprivate func printHeader(_ printer: ReportPrinter) {
        printer.print("Expenses " + date + "\n")
    }

    fileprivate func printExpense(_ expense: ExpenseType, _ printer: ReportPrinter) {
        printer.print(
            String(
                format: "%@\t%@\t$%.02f\n",
                expense.isOverage ? "X" : " ",
                ExpenseReportNamer.getName(from: expense),
                expense.amount.penniesToDollars
            )
        )
    }

    fileprivate func printTotals(_ printer: ReportPrinter) {
        printer.print(String(format: "\nMeal expenses $%.02f", mealExpenses.penniesToDollars))
        printer.print(String(format: "\nTotal $%.02f", total.penniesToDollars))
    }

    public func printReport(_ printer: ReportPrinter) {
        printHeader(printer)

        for expense in expenses {
            if expense.isMeal {
                mealExpenses += expense.amount
            }
            total += expense.amount

            printExpense(expense, printer)
        }
        
        printTotals(printer)
    }

    public func add(expense: ExpenseType) {
        expenses.append(expense)
    }

    private var date: String { "9/12/2002" }
}

fileprivate extension Double {
    var penniesToDollars: Double { self / 100.0 }
}
