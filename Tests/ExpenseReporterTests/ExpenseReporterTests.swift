import XCTest
@testable import ExpenseReporter

final class ExpenseReporterTests: XCTestCase {
    private var report = ExpenseReport()
    private var printer = MockReportPrinter()

    public func testSetUp() {
        report = ExpenseReport()
        printer = MockReportPrinter()
    }

    public func testPrintEmpty() {
        report.printReport(printer)
        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
            "\n" +
            "Meal expenses $0.00\n" +
            "Total $0.00",
            printer.printedText)
    }

    public func testPrintOneDinner() {
        report.add(expense: Expense(type: .dinner, amount: 1678))
        report.printReport(printer)

        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
            " \tDinner\t$16.78\n" +
            "\n" +
            "Meal expenses $16.78\n" +
            "Total $16.78",
            printer.printedText)
    }

    public func testTwoMeals() {
        report.add(expense: Expense(type: .dinner, amount: 1000))
        report.add(expense: Expense(type: .breakfast, amount: 500))
        report.printReport(printer)

        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
            " \tDinner\t$10.00\n" +
            " \tBreakfast\t$5.00\n" +

            "\n" +
            "Meal expenses $15.00\n" +
            "Total $15.00",
            printer.printedText)
    }

    public func testTwoMealsAndCarRental() {
        report.add(expense: Expense(type: .dinner, amount: 1000))
        report.add(expense: Expense(type: .breakfast, amount: 500))
        report.add(expense: Expense(type: .carRental, amount: 50000))
        report.printReport(printer)

        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
            " \tDinner\t$10.00\n" +
            " \tBreakfast\t$5.00\n" +
            " \tCar Rental\t$500.00\n" +
            "\n" +
            "Meal expenses $15.00\n" +
            "Total $515.00",
            printer.printedText)
    }

    public func testOverages() {
        report.add(expense: Expense(type: .breakfast, amount: 1000))
        report.add(expense: Expense(type: .breakfast, amount: 1001))
        report.add(expense: Expense(type: .dinner, amount: 5000))
        report.add(expense: Expense(type: .dinner, amount: 5001))
        report.printReport(printer)

        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
            " \tBreakfast\t$10.00\n" +
            "X\tBreakfast\t$10.01\n" +
            " \tDinner\t$50.00\n" +
            "X\tDinner\t$50.01\n" +
            "\n" +
            "Meal expenses $120.02\n" +
            "Total $120.02",
            printer.printedText)
    }
}
