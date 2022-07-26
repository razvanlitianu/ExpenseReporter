//
//  ExpenseNamer.swift
//  
//
//  Created by Razvan on 26.07.2022.
//

public protocol ExpenseNamer {
    static func getName(from expense: ExpenseType) -> String
}
