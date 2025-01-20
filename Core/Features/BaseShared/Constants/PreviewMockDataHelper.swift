//
//  PreviewMockDataHelper.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 13.11.2024.
//

import Foundation

enum PreviewMockDataHelper {
    static let journalEntry: JournalEntry = .init(
        postDate: Date(),
        content: "A very happy and interesting journal entry das dasd as dasd as das a A very happy and interesting journal entry das dasd as dasd as das a",
        wellBeingRating: 3
    )

    static let journalEntries: [JournalEntry] = [
        .init(postDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, content: "A very happy and interesting journal entry", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, content: "A day of reflection and solitude", wellBeingRating: 1),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -12, to: Date())!, content: "Watched a great movie and relaxed for couple of hours before going out with my best friends from childhood", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, content: "Spent time with friends, feeling energized", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, content: "A productive day at work", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, content: "Feeling a bit under the weather", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -9, to: Date())!, content: "Enjoyed a peaceful morning walk", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!, content: "A challenging day, but managed to stay positive", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -14, to: Date())!, content: "Had a stressful meeting, but resolved things", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, content: "A fantastic day of exploration and fun", wellBeingRating: 5),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -16, to: Date())!, content: "Started a new hobby, feeling excited", wellBeingRating: 5),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -17, to: Date())!, content: "A quiet day of reading and rest", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -18, to: Date())!, content: "Tough workday, feeling drained", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -20, to: Date())!, content: "Caught up with old friends, lots of laughs", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -21, to: Date())!, content: "Rainy day, but enjoyed it", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -23, to: Date())!, content: "Focused on personal growth, feeling proud", wellBeingRating: 5),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -25, to: Date())!, content: "Felt stressed about deadlines", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -26, to: Date())!, content: "Had a long, relaxing walk in the park", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -27, to: Date())!, content: "A challenging day but full of learning", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -28, to: Date())!, content: "Spent time cooking a new recipe, delicious!", wellBeingRating: 5)
    ]

    static let fewJournalEntries: [JournalEntry] = [
        .init(postDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, content: "A very happy and interesting journal entry", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, content: "A day of reflection and solitude", wellBeingRating: 1),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -12, to: Date())!, content: "Watched a great movie and relaxed for a couple of hours before going out with my best friends from childhood", wellBeingRating: 4)
    ]
}
