import SwiftUI

struct BottomActionBar: View {
    @Binding var selectedTab: MainTab

    private struct ActionItem: Identifiable {
        let id = UUID()
        let tab: MainTab
        let icon: String
    }

    private let items: [ActionItem] = [
        ActionItem(tab: .connections, icon: "person.3.fill"),
        ActionItem(tab: .placeholder, icon: "plus.app.fill"),
        ActionItem(tab: .chat, icon: "message.fill")
    ]

    var body: some View {
        HStack(spacing: 28) {
            ForEach(items) { item in
                Button {
                    selectedTab = item.tab
                } label: {
                    Image(systemName: item.icon)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 56, height: 56)
                        .background(background(for: item.tab))
                        .foregroundStyle(foreground(for: item.tab))
                        .clipShape(Circle())
                        .shadow(color: shadowColor(for: item.tab), radius: 12, x: 0, y: 8)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(20)
        .background(
            Capsule(style: .continuous)
                .fill(.thinMaterial)
                .shadow(color: Color.black.opacity(0.12), radius: 28, x: 0, y: 22)
        )
    }

    private func background(for tab: MainTab) -> some ShapeStyle {
        if selectedTab == tab {
            return AnyShapeStyle(
                LinearGradient(
                    colors: [Color(red: 0.96, green: 0.27, blue: 0.51), Color(red: 0.28, green: 0.64, blue: 0.94)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        } else {
            return AnyShapeStyle(Color.white)
        }
    }

    private func foreground(for tab: MainTab) -> some ShapeStyle {
        selectedTab == tab ? AnyShapeStyle(Color.white) : AnyShapeStyle(Color.secondary)
    }

    private func shadowColor(for tab: MainTab) -> Color {
        selectedTab == tab ? Color.black.opacity(0.24) : Color.black.opacity(0.05)
    }
}

struct BottomActionBar_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var selectedTab: MainTab = .connections

        var body: some View {
            BottomActionBar(selectedTab: $selectedTab)
                .padding()
                .background(Color(.systemGray6))
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
