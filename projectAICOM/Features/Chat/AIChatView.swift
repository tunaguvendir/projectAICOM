import SwiftUI

struct AIChatView: View {
    @State private var prompt: String = ""
    @State private var response: String = "Ask anything to spark AI-powered inspiration."

    var body: some View {
        VStack(spacing: 28) {
            VStack(alignment: .leading, spacing: 12) {
                Text("AI Companion")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(red: 0.91, green: 0.11, blue: 0.38), Color(red: 0.28, green: 0.64, blue: 0.94)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                Text("Let the assistant craft replies, brainstorm posts, and keep your network engaged.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .strokeBorder(Color.pink.opacity(0.3), lineWidth: 1.2)
                )
                .overlay(alignment: .topLeading) {
                    Text(response)
                        .padding(28)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }

            inputBar
        }
        .padding(.horizontal, 24)
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemGray6))
    }

    private var inputBar: some View {
        HStack(spacing: 16) {
            TextField("Ask me anything...", text: $prompt, axis: .vertical)
                .lineLimit(1...4)
                .padding(.horizontal, 18)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(.white)
                        .shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 8)
                )

            Button(action: {}) {
                Image(systemName: "sparkle.magnifyingglass")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 56, height: 56)
                    .background(
                        LinearGradient(
                            colors: [Color(red: 0.96, green: 0.27, blue: 0.51), Color(red: 0.28, green: 0.64, blue: 0.94)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 8)
            }
            .buttonStyle(.plain)

            Button(action: {}) {
                Image(systemName: "paperclip")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.secondary)
                    .frame(width: 48, height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 6)
                    )
            }
            .buttonStyle(.plain)
        }
    }
}

struct AIChatView_Previews: PreviewProvider {
    static var previews: some View {
        AIChatView()
    }
}
