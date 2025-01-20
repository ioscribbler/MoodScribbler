//
//  HomeViewModel.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 04.12.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var journalEntries: [JournalEntry] = []
    @Published var journalContent: String = ""
    @Published var rating: Int = 3
    @Published var errorMessage: String? = nil
    private let journalEntriesRepository: JournalEntriesRepository
    private var currentSelectedJournalEntry: JournalEntry?
    
    init(journalEntriesRepository: JournalEntriesRepository = InMemoryJournalEntriesRepository()) {
        self.journalEntriesRepository = journalEntriesRepository
    }
    
    func fillJournalData(for entry: JournalEntry) {
        self.journalContent = entry.content
        self.rating = entry.wellBeingRating
        self.currentSelectedJournalEntry = entry
    }
    
    func checkIfDataIsPresent() -> Bool {
        return !journalEntries.isEmpty
    }
    
    func saveOrUpdateJournalEntry() async {
        if currentSelectedJournalEntry == nil {
            await saveJournalEntry()
        } else {
            await updateJournalEntry()
        }
    }
    
    private func defaultingValues() async {
        await MainActor.run {
            journalContent.removeAll()
            currentSelectedJournalEntry = nil
            rating = 3
        }
    }
    
    private func updateJournalEntry() async {
        guard let entry = currentSelectedJournalEntry, !journalContent.isEmpty else {
            await defaultingValues()
            return
        }
        
        guard entry.content != journalContent || entry.wellBeingRating != rating else {
            await defaultingValues()
            return
        }
        
        let toBeUpdatedEntry = JournalEntry(postDate: entry.postDate, content: journalContent, wellBeingRating: rating)
        
        do {
            try await journalEntriesRepository.update(for: entry.id, with: toBeUpdatedEntry)
            await retrieveAllJournalEntries()
        } catch {
            debugPrint("Error updating journal entry: \(error)")
        }
        await defaultingValues()
    }
    
    private func saveJournalEntry() async {
        guard !journalContent.isEmpty else { return }
        let journalEntry = JournalEntry(postDate: Date(), content: journalContent, wellBeingRating: rating)
        
        do {
            try await journalEntriesRepository.create(journalEntry)
            await retrieveAllJournalEntries()
        } catch {
            debugPrint("Error creating a journal Entry! \(error)")
        }
        await MainActor.run {
            journalContent.removeAll()
            rating = 3
        }
    }
    
    func deleteJournalEntry(journalEntry: JournalEntry) async {
        do {
            try await journalEntriesRepository.delete(for: journalEntry.id)
            await retrieveAllJournalEntries()
        } catch {
            debugPrint("Error deleting a journal Entry! \(error)")
        }
    }
    
    func retrieveAllJournalEntries() async {
        do {
            let entries = try await journalEntriesRepository.retrieveAll()
            let sortedEntries = entries.sorted { $0.postDate > $1.postDate }
            await MainActor.run {
                journalEntries = sortedEntries
                errorMessage = nil
            }
        } catch {
            await MainActor.run {
                errorMessage = error.errorMessage
            }
        }
    }
}
