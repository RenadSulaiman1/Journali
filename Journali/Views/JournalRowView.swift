import SwiftUI

struct JournalRowView: View {
    let journal: Journal
    let onBookmarkTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(journal.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.69, green: 0.60, blue: 0.99))
                Spacer()
                Button {
                    onBookmarkTap()
                } label: {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(Color(red: 0.69, green: 0.60, blue: 0.99))
                }
                .buttonStyle(.plain)
            }

            Text(journal.date.formatted(date: .numeric, time: .omitted))
                .font(.caption)
                .foregroundColor(.gray)

            Text(journal.content)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    JournalRowView(
        journal: Journal(title: "My Birthday", content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."),
        onBookmarkTap: {}
    )
    .padding()
    .background(Color.black)
}
