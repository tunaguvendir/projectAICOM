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
    @State private var selectedTab: MainTab = .connections

    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                Group {
                    switch selectedTab {
                    case .connections:
                        ConnectedPeopleView()
                    case .chat:
                        AIChatView()
                    case .placeholder:
                        PlaceholderView()
                    }
                }
                .padding(.bottom, 90)
                .navigationBarHidden(true)
            }

            BottomActionBar(selectedTab: $selectedTab)
                .padding(.horizontal, 32)
                .padding(.bottom, 24)
        }
        .background(Color(.systemGray6))
    }
}

private struct PlaceholderView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "sparkles")
                .font(.system(size: 48))
                .foregroundStyle(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))

            Text("Discover upcoming AI-powered social tools.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding(32)
    }
}

private enum MainTab: Int {
    case connections
    case placeholder
    case chat
}
