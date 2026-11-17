import SwiftUI

struct EditJournalView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    let journal: Journal
    @State private var title: String
    @State private var content: String
    @State private var showDiscardAlert = false

    init(viewModel: JournalViewModel, journal: Journal) {
        self.viewModel = viewModel
        self.journal = journal
        _title = State(initialValue: journal.title)
        _content = State(initialValue: journal.content)
    }

    private var hasChanges: Bool {
        title != journal.title || content != journal.content
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                TextField("Title", text: $title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(journal.date.formatted(date: .numeric, time: .omitted))
                    .font(.system(size: 14))
                    .foregroundColor(Color("SecondaryText"))

                TextField("Type your Journal...", text: $content, axis: .vertical)
                    .font(.system(size: 18))

                Spacer()
            }
            .padding()
            .background(Color("CardSurface"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if hasChanges {
                            showDiscardAlert = true
                        } else {
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.addJournal(title: title, content: content)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    }
                    .tint(Color("PrimaryAccent"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                }
                }
            
            .confirmationDialog(
                "Are you sure you want to discard changes on this journal?",
                isPresented: $showDiscardAlert,
                titleVisibility: .visible
            ) {
                Button("Discard Changes", role: .destructive) {
                    dismiss()
                }
                Button("Keep Editing", role: .cancel) {}
            }
        }
    }
}
