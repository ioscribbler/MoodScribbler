//
//  JournalEntriesRepository.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 11.12.2024.
//

import Foundation

protocol JournalEntriesRepository {
    func create(_ journalEntry: JournalEntry) async throws(RepositoryError)
    func retrieve(for id: String) async throws(RepositoryError) -> JournalEntry
    func retrieveAll() async throws(RepositoryError) -> [JournalEntry]
    func update(for id: String, with toBeUpdatedJournalEntry: JournalEntry) async throws(RepositoryError)
    func delete(for id: String) async throws(RepositoryError)
}
