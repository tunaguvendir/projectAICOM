import SwiftUI

struct MessagesView: View {
    let theme: TabTheme

    private let conversations: [Conversation] = [
        Conversation(name: "Matteo Rossi", preview: "Let's align on the AR handoff deck.", time: "09:24"),
        Conversation(name: "Studio Loop", preview: "Drafted prompts for tonight's drop.", time: "08:41"),
        Conversation(name: "Leyla Demir", preview: "Flow feels calmer. Sending new cues.", time: "Yesterday"),
        Conversation(name: "Signal Lab", preview: "Beta testers are in.", time: "Tue")
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                header

                ForEach(conversations) { conversation in
                    conversationRow(conversation)
                }
            }
            .padding(.horizontal, 28)
            .padding(.top, 48)
            .padding(.bottom, 36)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Messages")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(theme.primary)

            Text("Quiet threads curated by the AI companion. Replies stay short and intentional.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private func conversationRow(_ conversation: Conversation) -> some View {
        HStack(spacing: 16) {
            Circle()
                .fill(theme.primary.opacity(0.12))
                .frame(width: 48, height: 48)
                .overlay(
                    Text(conversation.initials)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(theme.primary)
                )

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(conversation.name)
                        .font(.headline)
                    Spacer()
                    Text(conversation.time)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text(conversation.preview)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(Color.white.opacity(0.92))
                .overlay(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .strokeBorder(theme.primary.opacity(0.15), lineWidth: 1)
                )
        )
    }
}

private struct Conversation: Identifiable {
    let id = UUID()
    let name: String
    let preview: String
    let time: String

    var initials: String {
        let components = name.split(separator: " ")
        let firstTwo = components.prefix(2)
        return firstTwo.compactMap { $0.first }.map(String.init).joined()
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(theme: MainTab.messages.theme)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(MainTab.messages.theme.background)
    }
}
