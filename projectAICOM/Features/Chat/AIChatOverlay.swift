import SwiftUI

struct AIChatOverlay: View {
    @Binding var isPresented: Bool
    let theme: TabTheme

    @State private var prompt: String = ""
    @FocusState private var isPromptFocused: Bool

    private let suggestions = [
        "Summarize today's friend updates",
        "Draft a bilingual reply for Leyla",
        "Calm tone coaching for Alicia"
    ]

    private let conversation: [AIMessage] = [
        AIMessage(role: .assistant, text: "Merhaba! Ready to blend Italian and Turkish updates for your network."),
        AIMessage(role: .user, text: "Can you prepare a soft intro for Matteo's AR study?"),
        AIMessage(role: .assistant, text: "Sure. Matteo Rossi is experimenting with adaptive prompts in Torino. I'll write a short, warm note in English and Italian."),
        AIMessage(role: .assistant, text: "✨ Draft ready: 'Hey Matteo, Leyla loved the latest layers. Let's sync on the AR handoff deck tomorrow at 09:30. / Ciao Matteo, Leyla ha apprezzato gli ultimi layer. Sincronizziamoci domani alle 09:30.'")
    ]

    var body: some View {
        ZStack {
            Color.black.opacity(0.35)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
                        isPresented = false
                    }
                }

            VStack {
                Spacer()

                mainPanel
                    .frame(maxWidth: 620)
                    .padding(.horizontal, 22)
                    .padding(.bottom, 32)
            }
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
    }

    private var mainPanel: some View {
        VStack(spacing: 22) {
            header
            messageTimeline
            suggestionChips
            inputBar
        }
        .padding(28)
        .background(
            RoundedRectangle(cornerRadius: 36, style: .continuous)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 36, style: .continuous)
                        .strokeBorder(theme.primary.opacity(0.25), lineWidth: 1.4)
                )
                .shadow(color: theme.primary.opacity(0.35), radius: 36, x: 0, y: 24)
        )
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text("AI Companion")
                    .font(.system(size: 26, weight: .semibold, design: .rounded))
                    .foregroundStyle(theme.primary)

                Text("Keeping your multilingual, minimal social hub aligned.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
                    isPresented = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(theme.primary)
                    .padding(10)
                    .background(
                        Circle()
                            .fill(theme.primary.opacity(0.1))
                    )
            }
            .buttonStyle(.plain)
        }
    }

    private var messageTimeline: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                ForEach(conversation) { message in
                    messageBubble(for: message)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: 280)
    }

    private func messageBubble(for message: AIMessage) -> some View {
        let alignment: Alignment = message.role == .assistant ? .leading : .trailing
        let bubbleColor: Color = message.role == .assistant ? theme.primary.opacity(0.12) : theme.accent.opacity(0.16)
        let textColor: Color = message.role == .assistant ? theme.primary : theme.primary

        return Text(message.text)
            .font(.footnote)
            .foregroundStyle(textColor)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(bubbleColor)
            )
            .frame(maxWidth: .infinity, alignment: alignment)
    }

    private var suggestionChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(suggestions, id: \.self) { suggestion in
                    Button {
                        prompt = suggestion
                        isPromptFocused = true
                    } label: {
                        Text(suggestion)
                            .font(.caption.weight(.semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(theme.primary.opacity(0.1))
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var inputBar: some View {
        HStack(spacing: 14) {
            TextField("Ask something calm...", text: $prompt, axis: .vertical)
                .textFieldStyle(.plain)
                .focused($isPromptFocused)
                .padding(.horizontal, 18)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(theme.primary.opacity(0.08))
                )
                .lineLimit(1...4)

            Button {
                prompt.removeAll()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 52, height: 52)
                    .background(
                        Circle()
                            .fill(theme.primary)
                    )
            }
            .buttonStyle(.plain)
        }
    }
}

private struct AIMessage: Identifiable {
    enum Role { case assistant, user }

    let id = UUID()
    let role: Role
    let text: String
}

struct AIChatOverlay_Previews: PreviewProvider {
    static var previews: some View {
        AIChatOverlay(isPresented: .constant(true), theme: MainTab.ai.theme)
            .background(Color.gray.opacity(0.2))
    }
}
