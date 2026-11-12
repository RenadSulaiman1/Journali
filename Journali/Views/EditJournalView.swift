import SwiftUI

struct EditJournalView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    let journal: Journal
    @State private var title: String
    @State private var content: String

    init(viewModel: JournalViewModel, journal: Journal) {
        self.viewModel = viewModel
        self.journal = journal
        _title = State(initialValue: journal.title)
        _content = State(initialValue: journal.content)
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                TextField("Title", text: $title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(journal.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)

                TextField("Type your Journal...", text: $content, axis: .vertical)
                    .foregroundColor(.white)

                Spacer()
            }
            .padding()
            .background(Color(red: 0.11, green: 0.11, blue: 0.118))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.updateJournal(journal, title: title, content: content)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
