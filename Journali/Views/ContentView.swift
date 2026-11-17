import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var showNewJournal = false
    @State private var selectedJournal: Journal?
    @State private var journalToDelete: Journal?

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.journals.isEmpty {
                    EmptyStateView()
                } else {
                    List {
                        ForEach(viewModel.filteredJournals) { journal in
                            JournalRowView(journal: journal) {
                                viewModel.toggleBookmark(journal)
                            }
                            .onTapGesture {
                                selectedJournal = journal
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    journalToDelete = journal
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                                .tint(Color("Destructive"))
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Journal")
            .searchable(text: $viewModel.searchText, prompt: "Search")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Button(option.rawValue) {
                                viewModel.sortOption = option
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                }
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
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
