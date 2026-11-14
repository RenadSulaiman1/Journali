import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black, Color(red: 0.08, green: 0.06, blue: 0.14)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 12) {
                Image(systemName: "book.closed.fill")
                    .font(.system(size: 70))
                    .foregroundColor(Color(red: 0.69, green: 0.60, blue: 0.99))

                Text("Journali")
                    .font(.system(size: 42, weight: .black))
                    .foregroundColor(.white)

                Text("Your thoughts, your story")
                    .font(.body)
                    .foregroundColor(Color(red: 0.64, green: 0.60, blue: 0.60))
            }
        }
    }
}

#Preview {
    SplashView()
}
