import SwiftUI

struct ProfileView: View {
    let theme: TabTheme

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 28) {
                header
                focusAreas
                notifications
            }
            .padding(.horizontal, 28)
            .padding(.top, 48)
            .padding(.bottom, 40)
        }
    }

    private var header: some View {
        VStack(spacing: 16) {
            Circle()
                .fill(theme.accent)
                .frame(width: 96, height: 96)
                .overlay(
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 60, weight: .thin))
                        .foregroundStyle(Color.white.opacity(0.95))
                )
                .shadow(color: theme.accent.opacity(0.3), radius: 18, x: 0, y: 12)

            VStack(spacing: 6) {
                Text("You")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .foregroundStyle(theme.primary)
                Text("Designing the ambient AI experience for your network.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Capsule()
                .fill(theme.primary.opacity(0.12))
                .frame(height: 54)
                .overlay(
                    HStack(spacing: 16) {
                        Image(systemName: "sparkles.square.filled.on.square")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(theme.primary)
                        Text("AI mood: settled, ready for long form prompts")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal, 18)
                )
        }
        .frame(maxWidth: .infinity)
        .padding(28)
        .background(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.white.opacity(0.94))
                .overlay(
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .strokeBorder(theme.primary.opacity(0.15), lineWidth: 1.2)
                )
        )
    }

    private var focusAreas: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Focus areas")
                .font(.headline)
                .foregroundStyle(.primary)

            VStack(spacing: 12) {
                focusRow(title: "Calibrate AI tone", subtitle: "Ensure replies feel soft, bilingual and timely.")
                focusRow(title: "Invite 3 collaborators", subtitle: "Send warm intros to Leyla, Matteo and Sofia.")
                focusRow(title: "Publish recap", subtitle: "Export weekly signals to your studio dashboard.")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.white.opacity(0.94))
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .strokeBorder(theme.accent.opacity(0.16), lineWidth: 1.1)
                )
        )
    }

    private func focusRow(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(theme.primary)
            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(theme.primary.opacity(0.08))
        )
    }

    private var notifications: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Notifications")
                .font(.headline)
                .foregroundStyle(.primary)

            VStack(spacing: 14) {
                notificationRow(icon: "bell.badge.fill", message: "AI pinned a calm update from Ege")
                notificationRow(icon: "heart.text.square", message: "Sofia highlighted a mindful reply")
                notificationRow(icon: "antenna.radiowaves.left.and.right", message: "Signal Lab is streaming insights")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.white.opacity(0.94))
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .strokeBorder(theme.primary.opacity(0.12), lineWidth: 1)
                )
        )
    }

    private func notificationRow(icon: String, message: String) -> some View {
        HStack(spacing: 14) {
            Circle()
                .fill(theme.primary.opacity(0.14))
                .frame(width: 36, height: 36)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(theme.primary)
                )

            Text(message)
                .font(.caption)
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(theme.primary.opacity(0.05))
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(theme: MainTab.profile.theme)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(MainTab.profile.theme.background)
    }
}
