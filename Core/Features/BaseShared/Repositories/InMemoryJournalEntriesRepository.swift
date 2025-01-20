//
//  InMemoryJournalEntriesRepository.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 11.12.2024.
//

import Foundation

enum RepositoryError: Error {
    case notFound
    case unknown
    case deleteFailed
    case updateFailed
    case saveFailed
    case fetchFailed

    var errorMessage: String {
        switch self {
        case .notFound:
            return "Failed to fetch the journal Entry!"
        case .unknown:
            return "Something went wrong. Try again later!"
        case .deleteFailed:
            return "Failed to delete the journal Entry!"
        case .updateFailed:
            return "Failed to update the journal Entry!"
        case .saveFailed:
            return "Failed to save the journal Entry!"
        case .fetchFailed:
            return "Failed to fetch the journal Entries!"
        }
    }
}

actor InMemoryJournalEntriesRepository: JournalEntriesRepository {
    private var entries: [JournalEntry] = PreviewMockDataHelper.fewJournalEntries

    func create(_ journalEntry: JournalEntry) async throws(RepositoryError) {
        do {
            try await Task.sleep(nanoseconds: 1 * 500_000_000)
            entries.append(journalEntry)
        } catch {
            throw .saveFailed
        }
    }

    func retrieve(for id: String) async throws(RepositoryError) -> JournalEntry {
        do {
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            let entry = entries.first(where: { $0.id == id })
            guard let entry else {
                throw RepositoryError.notFound
            }
            return entry
        } catch RepositoryError.notFound {
            throw .notFound
        } catch {
            throw .unknown
        }
    }

    func retrieveAll() async throws(RepositoryError) -> [JournalEntry] {
        do {
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        } catch {
            throw .unknown
        }
        //throw .fetchFailed
        return entries
    }

    func update(for id: String, with toBeUpdatedJournalEntry: JournalEntry) async throws(RepositoryError) {
        do {
            try await Task.sleep(nanoseconds: 1 * 500_000_000)
            guard let index = entries.firstIndex(where: { $0.id == id }) else {
                throw RepositoryError.updateFailed
            }
            let fetchedEntry = entries[index]

            if fetchedEntry.content != toBeUpdatedJournalEntry.content || fetchedEntry.wellBeingRating != toBeUpdatedJournalEntry.wellBeingRating {
                entries[index] = toBeUpdatedJournalEntry
            }
        } catch RepositoryError.updateFailed {
            throw .updateFailed
        } catch {
            throw .unknown
        }
    }

    func delete(for id: String) async throws(RepositoryError) {
        do {
            try await Task.sleep(nanoseconds: 1 * 500_000_000)
            guard let index = entries.firstIndex(where: { $0.id == id }) else {
                throw RepositoryError.deleteFailed
            }
            entries.remove(at: index)
        } catch RepositoryError.deleteFailed {
            throw .deleteFailed
        } catch {
            throw .unknown
        }
    }
}
