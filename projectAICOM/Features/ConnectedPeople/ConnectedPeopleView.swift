import SwiftUI

struct ConnectedPeopleView: View {
    private let people = Person.samplePeople

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                ForEach(people) { person in
                    PersonCardView(person: person)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 40)
            .padding(.bottom, 16)
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemGray6))
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Connected People")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color(red: 0.91, green: 0.11, blue: 0.38), Color(red: 0.28, green: 0.64, blue: 0.94)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            Text("Stay close to the collaborators that spark your creativity.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ConnectedPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectedPeopleView()
    }
}
