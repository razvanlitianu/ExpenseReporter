//
//  ExpenseReportNamer.swift
//  
//
//  Created by Razvan on 26.07.2022.
//

public class ExpenseReportNamer: ExpenseNamer {
    public static func getName(from expense: ExpenseType) -> String {
        switch expense {
        case is DinnerExpense: return "Dinner"
        case is BreakfastExpense: return "Breakfast"
        case is CarRentalExpense: return "Car Rental"
        default: return "TILT"
        }
    }
}
