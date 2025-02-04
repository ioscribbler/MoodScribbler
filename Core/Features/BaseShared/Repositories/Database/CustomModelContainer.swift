//
//  CustomModelContainer.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 31.01.2025.
//

import SwiftData

final class CustomModelContainer {
    static let container: ModelContainer = {
        do {
            let schema = Schema([JournalEntryLocalModel.self])
            return try ModelContainer(for: schema, configurations: [])
        } catch {
            fatalError("Failed to create a ModelContainer: \(error)")
        }
    }()
}
