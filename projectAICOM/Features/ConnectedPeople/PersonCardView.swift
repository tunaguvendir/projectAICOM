import SwiftUI

struct PersonCardView: View {
    let person: Person

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: person.imageName)
                .font(.system(size: 32))
                .frame(width: 56, height: 56)
                .foregroundStyle(.white)
                .background(person.color.gradient)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .firstTextBaseline) {
                    Text(person.name)
                        .font(.headline)
                    Text("•")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(person.subtitle)
                        .font(.subheadline)
                        .foregroundColor(person.color)
                }
                Text(person.detail)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.04), radius: 12, x: 0, y: 8)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .strokeBorder(person.color.opacity(0.35), lineWidth: 1)
        )
    }
}

struct PersonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCardView(person: .samplePeople.first!)
            .padding()
            .background(Color(.systemGray6))
    }
}
