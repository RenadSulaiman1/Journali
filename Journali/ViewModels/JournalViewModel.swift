import Foundation
import Combine

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []

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
