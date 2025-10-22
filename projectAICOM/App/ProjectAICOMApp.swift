import SwiftUI

@main
struct ProjectAICOMApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

private struct RootView: View {
    @State private var selectedTab: MainTab = .home
    @State private var previousTab: MainTab = .home
    @State private var isAIModalPresented = false

    var body: some View {
        ZStack {
            selectedTab.theme.background
                .ignoresSafeArea()

            Group {
                switch selectedTab {
                case .home:
                    HomeFeedView(theme: selectedTab.theme)
                case .friends:
                    ConnectedPeopleView(theme: selectedTab.theme)
                case .ai:
                    HomeFeedView(theme: selectedTab.theme)
                case .messages:
                    MessagesView(theme: selectedTab.theme)
                case .profile:
                    ProfileView(theme: selectedTab.theme)
                }
            }
            .padding(.bottom, 120)
            .animation(.easeInOut(duration: 0.25), value: selectedTab)

            VStack {
                Spacer()
                MinimalTabBar(
                    selectedTab: $selectedTab,
                    aiButtonAction: {
                        previousTab = selectedTab == .ai ? previousTab : selectedTab
                        isAIModalPresented = true
                    }
                )
                .padding(.horizontal, 28)
                .padding(.bottom, 24)
            }
        }
        .overlay(aiOverlay)
        .onChange(of: selectedTab) { newValue in
            if newValue != .ai {
                previousTab = newValue
            }
        }
        .onChange(of: isAIModalPresented) { newValue in
            if !newValue {
                withAnimation(.easeInOut(duration: 0.2)) {
                    selectedTab = previousTab
                }
            }
        }
    }

    @ViewBuilder
    private var aiOverlay: some View {
        if isAIModalPresented {
            AIChatOverlay(
                isPresented: $isAIModalPresented,
                theme: MainTab.ai.theme
            )
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .zIndex(1)
        }
    }
}

enum MainTab: Int {
    case home
    case friends
    case ai
    case messages
    case profile

    var title: String {
        switch self {
        case .home: return "Home"
        case .friends: return "Friends"
        case .ai: return "AI"
        case .messages: return "Messages"
        case .profile: return "Profile"
        }
    }

    var iconName: String {
        switch self {
        case .home: return "house.fill"
        case .friends: return "person.2.fill"
        case .ai: return "sparkles"
        case .messages: return "bubble.left.and.bubble.right.fill"
        case .profile: return "person.crop.circle.fill"
        }
    }

    var theme: TabTheme {
        switch self {
        case .home:
            return TabTheme(
                background: Color(red: 0.96, green: 0.98, blue: 0.96),
                primary: Color(red: 0.19, green: 0.57, blue: 0.45),
                accent: Color(red: 0.27, green: 0.72, blue: 0.57)
            )
        case .friends:
            return TabTheme(
                background: Color(red: 0.95, green: 0.97, blue: 1.00),
                primary: Color(red: 0.16, green: 0.39, blue: 0.77),
                accent: Color(red: 0.35, green: 0.61, blue: 0.98)
            )
        case .ai:
            return TabTheme(
                background: Color(red: 1.00, green: 0.95, blue: 0.98),
                primary: Color(red: 0.85, green: 0.22, blue: 0.51),
                accent: Color(red: 0.99, green: 0.36, blue: 0.66)
            )
        case .messages:
            return TabTheme(
                background: Color(red: 0.96, green: 0.95, blue: 1.00),
                primary: Color(red: 0.44, green: 0.31, blue: 0.83),
                accent: Color(red: 0.62, green: 0.49, blue: 0.94)
            )
        case .profile:
            return TabTheme(
                background: Color(red: 1.00, green: 0.97, blue: 0.92),
                primary: Color(red: 0.76, green: 0.42, blue: 0.12),
                accent: Color(red: 0.94, green: 0.56, blue: 0.19)
            )
        }
    }
}

struct TabTheme: Equatable {
    let background: Color
    let primary: Color
    let accent: Color
}
