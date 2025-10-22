import SwiftUI

struct ConnectedPeopleView: View {
    let theme: TabTheme

    private let people = Person.samplePeople

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                header

                ForEach(people) { person in
                    PersonCardView(person: person, theme: theme)
                }
            }
            .padding(.horizontal, 28)
            .padding(.top, 48)
            .padding(.bottom, 28)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Friends & collaborators")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(theme.primary)

            Text("A calm list of the people co-creating with you this week. Tap a card to open their focus threads.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct ConnectedPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectedPeopleView(theme: MainTab.friends.theme)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(MainTab.friends.theme.background)
    }
}
