import SwiftUI

struct PersonCardView: View {
    let person: Person
    let theme: TabTheme

    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 18) {
                AvatarPortrait(descriptor: person.avatar)

                VStack(alignment: .leading, spacing: 8) {
                    Text(person.name)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    Text(person.role)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(theme.primary)

                    Text(person.focus)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                UniversityBadge(university: person.university)
            }

            Divider()
                .overlay(theme.primary.opacity(0.08))

            HStack(spacing: 12) {
                Image(systemName: "bubble.left")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(theme.primary)

                Text("Last sync: " + person.syncStatus)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()

                Text("Open thread")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(theme.primary)
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.white.opacity(0.95))
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .strokeBorder(person.accentColor.opacity(0.32), lineWidth: 1.2)
                )
                .shadow(color: person.accentColor.opacity(0.18), radius: 22, x: 0, y: 16)
        )
    }
}

private struct AvatarPortrait: View {
    let descriptor: AvatarDescriptor

    var body: some View {
        ZStack {
            Circle()
                .fill(descriptor.background)

            VStack(spacing: 2) {
                HairShape()
                    .fill(descriptor.hair)
                    .frame(width: 58, height: 42)

                Circle()
                    .fill(descriptor.skin)
                    .frame(width: 52, height: 52)
                    .overlay(
                        Circle()
                            .stroke(descriptor.hair.opacity(0.18), lineWidth: 1)
                    )
                    .overlay(faceFeatures)
            }

            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .strokeBorder(descriptor.highlight.opacity(0.7), lineWidth: 1.2)
        }
        .frame(width: 84, height: 84)
        .shadow(color: descriptor.highlight.opacity(0.35), radius: 12, x: 0, y: 8)
    }

    private var faceFeatures: some View {
        VStack(spacing: 8) {
            HStack(spacing: 14) {
                eye
                eye
            }

            Capsule()
                .fill(descriptor.highlight.opacity(0.65))
                .frame(width: 26, height: 4)
        }
        .offset(y: 12)
    }

    private var eye: some View {
        Capsule()
            .fill(Color.black.opacity(0.65))
            .frame(width: 10, height: 6)
    }
}

private struct UniversityBadge: View {
    let university: University

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(university.primary.opacity(0.12))
                    .frame(width: 54, height: 54)

                emblem
            }

            Text(university.shortName)
                .font(.caption2.weight(.semibold))
                .foregroundStyle(university.primary)
        }
    }

    @ViewBuilder
    private var emblem: some View {
        switch university.emblem {
        case .polito:
            ZStack {
                Circle()
                    .fill(university.primary)
                    .frame(width: 30, height: 30)
                Image(systemName: "gearshape")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
        case .bogazici:
            ZStack {
                Diamond()
                    .fill(university.primary)
                    .frame(width: 34, height: 34)
                Diamond()
                    .strokeBorder(university.secondary, lineWidth: 2)
                    .frame(width: 42, height: 42)
            }
        case .harvard:
            Shield()
                .fill(university.primary)
                .frame(width: 34, height: 40)
                .overlay(
                    VStack(spacing: 2) {
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 18, height: 4)
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 22, height: 4)
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 18, height: 4)
                    }
                )
        case .ucl:
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(university.primary)
                .frame(width: 38, height: 26)
                .overlay(
                    Text("UCL")
                        .font(.system(size: 12, weight: .heavy, design: .rounded))
                        .foregroundColor(university.secondary)
                )
        case .koc:
            ZStack {
                Circle()
                    .strokeBorder(university.primary, lineWidth: 2)
                    .frame(width: 40, height: 40)
                Circle()
                    .fill(university.primary.opacity(0.15))
                    .frame(width: 26, height: 26)
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(university.primary)
            }
        }
    }
}

private struct HairShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: rect.width / 2, height: rect.height / 1.8))
        return path
    }
}

private struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

private struct Shield: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY), control: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}

struct PersonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCardView(person: Person.samplePeople.first!, theme: MainTab.friends.theme)
            .padding()
            .background(MainTab.friends.theme.background)
            .previewLayout(.sizeThatFits)
    }
}
