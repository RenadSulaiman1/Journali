import Foundation
import Combine

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []
    @Published var searchText = ""
    @Published var sortOption: SortOption = .entryDate

    var filteredJournals: [Journal] {
        var result = journals

        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }

        switch sortOption {
        case .bookmark:
            result.sort { $0.isBookmarked && !$1.isBookmarked }
        case .entryDate:
            result.sort { $0.date > $1.date }
        }

        return result
    }

    func addJournal(title: String, content: String) {
        let newJournal = Journal(title: title, content: content)
        journals.append(newJournal)
    }

    func updateJournal(_ journal: Journal, title: String, content: String) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].title = title
            journals[index].content = content
        }
    }

    func deleteJournal(_ journal: Journal) {
        journals.removeAll { $0.id == journal.id }
    }

    func toggleBookmark(_ journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].isBookmarked.toggle()
        }
    }
}
