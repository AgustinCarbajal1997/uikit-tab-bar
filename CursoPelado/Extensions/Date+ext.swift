//
//  Date+ext.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 07/01/2025.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
