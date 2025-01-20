//
//  Date.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 18.11.2024.
//

import Foundation

extension Date {
    func formattedAsDayMonthYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy" // 13 Oct 1993
        return formatter.string(from: self)
    }
}
