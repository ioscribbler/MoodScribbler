//
//  JournalEntry.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 13.11.2024.
//

import Foundation

struct JournalEntry: Identifiable {
    let id: String = UUID().uuidString
    let postDate: Date
    let content: String
    let wellBeingRating: Int // 1 -> 5
}
