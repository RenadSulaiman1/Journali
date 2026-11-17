import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image("JournalIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100)

            Text("Journali")
                .font(.system(size: 42, weight: .black))

            Text("Your thoughts, your story")
                .font(.system(size: 18))
                .foregroundColor(Color("SecondaryText"))
        }
    }
}

#Preview {
    SplashView()
        .preferredColorScheme(.dark)
}
