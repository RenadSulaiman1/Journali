import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var showNewJournal = false
    @State private var selectedJournal: Journal?
    @State private var journalToDelete: Journal?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                if viewModel.journals.isEmpty {
                    EmptyStateView()
                } else {
                    List {
                        ForEach(viewModel.journals) { journal in
                            JournalRowView(journal: journal) {
                                viewModel.toggleBookmark(journal)
                            }
                            .onTapGesture {
                                selectedJournal = journal
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    journalToDelete = journal
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                                .tint(.red)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewJournal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewJournal) {
                NewJournalView(viewModel: viewModel)
            }
            .sheet(item: $selectedJournal) { journal in
                EditJournalView(viewModel: viewModel, journal: journal)
            }
            .alert("Delete Journal?", isPresented: Binding(
                get: { journalToDelete != nil },
                set: { if !$0 { journalToDelete = nil } }
            )) {
                Button("Cancel", role: .cancel) {
                    journalToDelete = nil
                }
                Button("Delete", role: .destructive) {
                    if let journal = journalToDelete {
                        viewModel.deleteJournal(journal)
                    }
                    journalToDelete = nil
                }
            } message: {
                Text("Are you sure you want to delete this journal?")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
