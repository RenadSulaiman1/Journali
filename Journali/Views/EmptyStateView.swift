import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image("EmptyBook")
                .resizable()
                .scaledToFit()
                .frame(width: 140)

            Text("Begin Your Journal")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("AccentPurple"))

            Text("Craft your personal diary, tap the plus icon to begin")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    EmptyStateView()
        .preferredColorScheme(.dark)
}
