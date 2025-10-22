import SwiftUI

struct MinimalTabBar: View {
    @Binding var selectedTab: MainTab
    let aiButtonAction: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            tabButton(for: .home)
            tabButton(for: .friends)

            Spacer(minLength: 0)

            aiButton

            Spacer(minLength: 0)

            tabButton(for: .messages)
            tabButton(for: .profile)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(.ultraThinMaterial)
                .shadow(color: Color.black.opacity(0.08), radius: 18, x: 0, y: 12)
        )
    }

    private func tabButton(for tab: MainTab) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.18)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 6) {
                Image(systemName: tab.iconName)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 44, height: 44)
                    .foregroundStyle(selectedTab == tab ? tab.theme.primary : Color.secondary)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(selectedTab == tab ? tab.theme.primary.opacity(0.12) : Color.clear)
                    )

                Text(tab.title)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(selectedTab == tab ? tab.theme.primary : Color.secondary)
            }
            .frame(width: 76)
        }
        .buttonStyle(.plain)
    }

    private var aiButton: some View {
        let theme = MainTab.ai.theme
        let isActive = selectedTab == .ai

        return Button {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                selectedTab = .ai
            }
            aiButtonAction()
        } label: {
            ZStack {
                Circle()
                    .fill(isActive ? theme.accent : theme.primary)
                    .frame(width: 72, height: 72)
                    .shadow(color: theme.primary.opacity(isActive ? 0.45 : 0.35), radius: 20, x: 0, y: 12)

                Circle()
                    .strokeBorder(Color.white.opacity(isActive ? 0.6 : 0.45), lineWidth: isActive ? 2 : 1)
                    .frame(width: 72, height: 72)

                VStack(spacing: 4) {
                    Image(systemName: MainTab.ai.iconName)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text(MainTab.ai.title)
                        .font(.caption2.bold())
                        .foregroundColor(.white.opacity(0.92))
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Open AI Companion")
    }
}

struct MinimalTabBar_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var selectedTab: MainTab = .home

        var body: some View {
            MinimalTabBar(selectedTab: $selectedTab) {}
                .padding()
                .background(MainTab.home.theme.background)
        }
    }

    static var previews: some View {
        PreviewWrapper()
            .previewLayout(.sizeThatFits)
    }
}
