import Foundation
import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let detail: String
    let color: Color
    let imageName: String
}

extension Person {
    static let samplePeople: [Person] = [
        Person(
            name: "Alice Johnson",
            subtitle: "Best Friend",
            detail: "University of Toronto",
            color: Color(red: 0.96, green: 0.27, blue: 0.51),
            imageName: "person.circle.fill"
        ),
        Person(
            name: "Bob Smith",
            subtitle: "Mentor",
            detail: "AI Research Lab",
            color: Color(red: 0.31, green: 0.67, blue: 0.98),
            imageName: "person.2.wave.2.fill"
        ),
        Person(
            name: "Charlie Brown",
            subtitle: "Product Designer",
            detail: "Seattle, WA",
            color: Color(red: 0.56, green: 0.85, blue: 0.56),
            imageName: "scribble.variable"
        ),
        Person(
            name: "Diana Miller",
            subtitle: "Growth Partner",
            detail: "Remote Collaborator",
            color: Color(red: 0.99, green: 0.70, blue: 0.22),
            imageName: "bolt.heart.fill"
        ),
        Person(
            name: "Eve Davis",
            subtitle: "AI Strategist",
            detail: "London, UK",
            color: Color(red: 0.74, green: 0.52, blue: 0.94),
            imageName: "brain.head.profile"
        )
    ]
}
