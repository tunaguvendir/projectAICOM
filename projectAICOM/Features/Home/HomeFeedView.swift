import SwiftUI

struct HomeFeedView: View {
    let theme: TabTheme

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                header

                VStack(spacing: 18) {
                    highlightCard(
                        title: "Today with your network",
                        subtitle: "See how your collaborators are experimenting with AI-led storytelling.",
                        icon: "sparkles",
                        background: theme.accent.opacity(0.18)
                    )

                    highlightCard(
                        title: "Personalized prompts",
                        subtitle: "AI curated threads crafted for Matteo, Leyla, Alicia and 12 others.",
                        icon: "quote.bubble.fill",
                        background: theme.primary.opacity(0.12)
                    )
                }

                Text("Quick Actions")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(theme.primary.opacity(0.8))

                actionGrid
            }
            .padding(.horizontal, 28)
            .padding(.top, 48)
            .padding(.bottom, 36)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Minimal social intelligence")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(theme.primary)

            Text("Coordinate your people, prompts and conversations from a calm, AI aware workspace.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func highlightCard(title: String, subtitle: String, icon: String, background: Color) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(theme.primary)
                .frame(width: 44, height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(theme.background)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .strokeBorder(theme.primary.opacity(0.15), lineWidth: 1)
                        )
                )

            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)

            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            Divider()
                .overlay(theme.primary.opacity(0.12))

            Text("Open overview")
                .font(.caption.weight(.semibold))
                .foregroundStyle(theme.primary)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.white.opacity(0.92))
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .strokeBorder(background, lineWidth: 1.5)
                )
                .shadow(color: Color.black.opacity(0.04), radius: 16, x: 0, y: 12)
        )
    }

    private var actionGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)]) {
            actionButton(title: "Share recap", icon: "paperplane.fill")
            actionButton(title: "Plan event", icon: "calendar.badge.clock")
            actionButton(title: "Record note", icon: "mic.fill")
            actionButton(title: "Insights", icon: "chart.line.uptrend.xyaxis")
        }
    }

    private func actionButton(title: String, icon: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(theme.primary)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(theme.primary.opacity(0.12))
                )

            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, minHeight: 96)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.white.opacity(0.9))
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .strokeBorder(theme.primary.opacity(0.15), lineWidth: 1)
                )
        )
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView(theme: MainTab.home.theme)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
