//
//  HomeView.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 31.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showSheet: Bool = false
    @State private var detentHeight: CGFloat = 0
    @State private var shouldCreateNewJournalEntry: Bool = false
    @State private var showToolbarLoadingSpinner: Bool = false
    @State private var showLoadingSpinner: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppColorTheme.backgroundColor.ignoresSafeArea()
                mainContent
                    .navigationTitle("Mood scribbler")
                    .toolbarBackground(AppColorTheme.secondaryBackgroundColor.opacity(0.5), for: .navigationBar)
                    .toolbarBackgroundVisibility(.visible, for: .navigationBar)
                    .toolbar {
                        if showToolbarLoadingSpinner {
                            toolBarProgressView
                        }
                        addButton
                    }
                    .sheet(isPresented: $showSheet) {
                        shouldCreateNewJournalEntry = true
                    } content: {
                        sheetContentView
                    }
                    .task(id: shouldCreateNewJournalEntry) {
                        guard shouldCreateNewJournalEntry else { return }
                        showToolbarLoadingSpinner = true
                        await viewModel.saveOrUpdateJournalEntry()
                        showToolbarLoadingSpinner = false
                        shouldCreateNewJournalEntry = false
                    }
                    .task {
                        showLoadingSpinner = true
                        await viewModel.retrieveAllJournalEntries()
                        showLoadingSpinner = false
                    }
            }
        }
    }
}

extension HomeView {
    private var mainContent: some View {
        ScrollView {
            cells
        }
        .overlay {
            if showLoadingSpinner {
                loadingSpinnerView
            } else if let _ = viewModel.errorMessage {
                errorStateView
            } else if !viewModel.checkIfDataIsPresent() {
                emptyStateView
            }
        }
    }
    
    private var loadingSpinnerView: some View {
        ProgressView("Loading...")
            .progressViewStyle(.circular)
            .padding()
            .controlSize(.large)
            .tint(AppColorTheme.accentColor)
            .foregroundStyle(AppColorTheme.whiteColor)
            .bold()
    }
    
    private var errorStateView: some View {
        ContentUnavailableView {
            Label("There was an error.", systemImage: "x.circle")
                .foregroundStyle(AppColorTheme.errorColor)
        } description: {
            Text(viewModel.errorMessage ?? "")
                .foregroundStyle(AppColorTheme.secondaryTextColor)
                .bold()
        } actions: {
            Button("Retry") {
                Task {
                    showLoadingSpinner = true
                    await viewModel.retrieveAllJournalEntries()
                    showLoadingSpinner = false
                }
            }
            .buttonStyle(.bordered)
        }
    }
    
    private var emptyStateView: some View {
        ContentUnavailableView {
            Label("No journal entries yet.", systemImage: "document")
                .foregroundStyle(AppColorTheme.secondaryTextColor)
        } description: {
            Text("You don't have any saved entries yet.")
                .foregroundStyle(AppColorTheme.secondaryTextColor)
        } actions: {
            Button("Create a new entry here") {
                showSheet.toggle()
            }
            .buttonStyle(.bordered)
        }
    }
    
    private var sheetContentView: some View {
        ZStack {
            AppColorTheme.secondaryBackgroundColor
                .opacity(0.6)
                .ignoresSafeArea()
            AddJournalEntryView(
                dayDetails: $viewModel.journalContent,
                ratingSelection: $viewModel.rating
            )
            .fixedSize(horizontal: false, vertical: true)
            .readAndBindHeight(to: $detentHeight)
        }
        .presentationDetents([.height(detentHeight)])
        .presentationDragIndicator(.visible)
        .presentationBackground(.ultraThinMaterial)
        .preferredColorScheme(.dark)
    }
    
    private var cells: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            ForEach(viewModel.journalEntries) { entry in
                JournalCell(journalEntry: entry) {
                    showBottomSheetWithData(for: entry)
                }
                .contextMenu {
                    Button {
                        Task {
                            self.showToolbarLoadingSpinner = true
                            await viewModel.deleteJournalEntry(journalEntry: entry)
                            self.showToolbarLoadingSpinner = false
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 38)
    }
    
    private func showBottomSheetWithData(for entry: JournalEntry) {
        viewModel.fillJournalData(for: entry)
        showSheet.toggle()
    }
    
    private var addButton: some View {
        Button {
            showSheet.toggle()
        } label: {
            Image(systemName: "plus.app")
                .font(.system(size: 18, weight: .semibold))
        }
    }
    
    private var toolBarProgressView: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(AppColorTheme.accentColor)
    }
}

#Preview {
    HomeView()
        .environment(\.font, CustomFont.body)
}
