import SwiftUI

struct NewJournalView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                TextField("Title", text: $title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(Date().formatted(date: .numeric, time: .omitted))
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
                        viewModel.addJournal(title: title, content: content)
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

#Preview {
    NewJournalView(viewModel: JournalViewModel())
}
