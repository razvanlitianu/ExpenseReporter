//
//  ExpenseReporter.swift
//
//
//  Created by Razvan on 26.07.2022.
//
import Foundation

public class ExpenseReporter {
    let report: ExpenseReport
    let printer: ReportPrinter

    init(report: ExpenseReport, printer: ReportPrinter) {
        self.report = report
        self.printer = printer
    }

    fileprivate func printHeader() {
        printer.print("Expenses " + date + "\n")
    }

    fileprivate func printExpenses() {
        for expense in report.expenses {
            printExpense(expense)
        }
    }

    fileprivate func printExpense(_ expense: ExpenseType) {
        printer.print(
            String(
                format: "%@\t%@\t$%.02f\n",
                expense.isOverage ? "X" : " ",
                ExpenseReportNamer.getName(from: expense),
                expense.amount.penniesToDollars
            )
        )
    }

    fileprivate func printTotals() {
        printer.print(String(format: "\nMeal expenses $%.02f", report.mealExpenses.penniesToDollars))
        printer.print(String(format: "\nTotal $%.02f", report.total.penniesToDollars))
    }

    fileprivate func printExpensesAndTotals() {
        printHeader()
        printExpenses()
        printTotals()
    }

    public func printReport() {
        report.totalUpExpenses()
        printExpensesAndTotals()
    }

    private var date: String { "9/12/2002" }
}

fileprivate extension Double {
    var penniesToDollars: Double { self / 100.0 }
}
