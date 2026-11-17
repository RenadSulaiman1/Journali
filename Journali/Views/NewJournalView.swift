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

                Text(Date().formatted(date: .numeric, time: .omitted))
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
                            .foregroundColor(.white)
                    }
                    .tint(Color("PrimaryAccent"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                }
                    }
                }
            }
        }
    


#Preview {
    NewJournalView(viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}

