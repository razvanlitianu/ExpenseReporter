//
//  MockReportPrinter.swift
//  
//
//  Created by Razvan on 26.07.2022.
//

import ExpenseReporter

class MockReportPrinter: ReportPrinter {
    public private(set) var printedText: String = ""

    public func print(_ text: String) {
        printedText += text
    }
}
