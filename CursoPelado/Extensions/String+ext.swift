//
//  String+ext.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 07/01/2025.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale        =  Locale(identifier: "es_AR")
        dateFormatter.timeZone      = .current
        
        return dateFormatter.date(from: self)!
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
