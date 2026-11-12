import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "book.closed")
                .font(.system(size: 80))
                .foregroundColor(Color(red: 0.69, green: 0.60, blue: 0.99))

            Text("Begin Your Journal")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.69, green: 0.60, blue: 0.99))

            Text("Craft your personal diary, tap the plus icon to begin")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    EmptyStateView()
        .background(Color.black)
}
