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
                    .foregroundColor(Color("AccentPurple"))
                Spacer()
                Button {
                    onBookmarkTap()
                } label: {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(Color("AccentPurple"))
                }
                .buttonStyle(.plain)
            }

            Text(journal.date.formatted(date: .numeric, time: .omitted))
                .font(.caption)
                .foregroundColor(Color("SecondaryText"))

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
