//
//  JournalEntry.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 13.11.2024.
//

import Foundation
import SwiftData

struct JournalEntry: Identifiable {
    let id: String
    let postDate: Date
    let content: String
    let wellBeingRating: Int // 1 -> 5

    init(
        id: String = UUID().uuidString,
        postDate: Date,
        content: String,
        wellBeingRating: Int
    ) {
        self.id = id
        self.postDate = postDate
        self.content = content
        self.wellBeingRating = wellBeingRating
    }
}

@Model
class JournalEntryLocalModel {
    @Attribute(.unique) var id: String
    var postDate: Date
    var content: String
    var wellBeingRating: Int

    init(
        id: String,
        postDate: Date,
        content: String,
        wellBeingRating: Int
    ) {
        self.id = id
        self.postDate = postDate
        self.content = content
        self.wellBeingRating = wellBeingRating
    }
}
