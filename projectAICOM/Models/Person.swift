import Foundation
import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let focus: String
    let syncStatus: String
    let accentColor: Color
    let avatar: AvatarDescriptor
    let university: University
}

struct AvatarDescriptor {
    let background: Color
    let skin: Color
    let hair: Color
    let highlight: Color
}

struct University {
    enum Emblem {
        case polito
        case bogazici
        case harvard
        case ucl
        case koc
    }

    let name: String
    let shortName: String
    let location: String
    let primary: Color
    let secondary: Color
    let emblem: Emblem
}

extension Person {
    static let samplePeople: [Person] = [
        Person(
            name: "Matteo Rossi",
            role: "XR Research Lead",
            focus: "Mapping adaptive prompts for real-time city layers.",
            syncStatus: "shared 12 minutes ago",
            accentColor: Color(red: 0.29, green: 0.55, blue: 0.96),
            avatar: AvatarDescriptor(
                background: Color(red: 0.87, green: 0.93, blue: 1.0),
                skin: Color(red: 0.99, green: 0.90, blue: 0.79),
                hair: Color(red: 0.18, green: 0.22, blue: 0.31),
                highlight: Color(red: 0.29, green: 0.55, blue: 0.96)
            ),
            university: University(
                name: "Politecnico di Torino",
                shortName: "PoliTO",
                location: "Torino, Italy",
                primary: Color(red: 0.07, green: 0.33, blue: 0.62),
                secondary: .white,
                emblem: .polito
            )
        ),
        Person(
            name: "Leyla Demir",
            role: "Community Architect",
            focus: "Designing slow social rituals for hybrid alumni circles.",
            syncStatus: "synced 1 hour ago",
            accentColor: Color(red: 0.21, green: 0.48, blue: 0.84),
            avatar: AvatarDescriptor(
                background: Color(red: 0.90, green: 0.95, blue: 1.0),
                skin: Color(red: 0.99, green: 0.88, blue: 0.76),
                hair: Color(red: 0.13, green: 0.16, blue: 0.24),
                highlight: Color(red: 0.21, green: 0.48, blue: 0.84)
            ),
            university: University(
                name: "Boğaziçi Üniversitesi",
                shortName: "Boğaziçi",
                location: "İstanbul, Türkiye",
                primary: Color(red: 0.03, green: 0.28, blue: 0.56),
                secondary: Color(red: 0.64, green: 0.82, blue: 0.97),
                emblem: .bogazici
            )
        ),
        Person(
            name: "Alicia Carter",
            role: "Narrative Strategist",
            focus: "Using AI to remix documentary scripts for civic launches.",
            syncStatus: "updated 3 hours ago",
            accentColor: Color(red: 0.75, green: 0.20, blue: 0.25),
            avatar: AvatarDescriptor(
                background: Color(red: 1.0, green: 0.93, blue: 0.94),
                skin: Color(red: 0.97, green: 0.83, blue: 0.76),
                hair: Color(red: 0.28, green: 0.17, blue: 0.12),
                highlight: Color(red: 0.75, green: 0.20, blue: 0.25)
            ),
            university: University(
                name: "Harvard University",
                shortName: "Harvard",
                location: "Cambridge, USA",
                primary: Color(red: 0.56, green: 0.0, blue: 0.09),
                secondary: .white,
                emblem: .harvard
            )
        ),
        Person(
            name: "Ege Yılmaz",
            role: "Signal Designer",
            focus: "Building multilingual tone analyzers for private channels.",
            syncStatus: "listening now",
            accentColor: Color(red: 0.87, green: 0.32, blue: 0.39),
            avatar: AvatarDescriptor(
                background: Color(red: 1.0, green: 0.92, blue: 0.94),
                skin: Color(red: 0.98, green: 0.86, blue: 0.72),
                hair: Color(red: 0.12, green: 0.12, blue: 0.16),
                highlight: Color(red: 0.87, green: 0.32, blue: 0.39)
            ),
            university: University(
                name: "Koç Üniversitesi",
                shortName: "Koç",
                location: "İstanbul, Türkiye",
                primary: Color(red: 0.62, green: 0.09, blue: 0.12),
                secondary: Color(red: 0.98, green: 0.88, blue: 0.74),
                emblem: .koc
            )
        ),
        Person(
            name: "Sofia Romano",
            role: "Ethical AI Partner",
            focus: "Auditing response tone before sharing with the wider network.",
            syncStatus: "calibrated yesterday",
            accentColor: Color(red: 0.32, green: 0.55, blue: 0.46),
            avatar: AvatarDescriptor(
                background: Color(red: 0.90, green: 0.96, blue: 0.92),
                skin: Color(red: 0.97, green: 0.87, blue: 0.74),
                hair: Color(red: 0.18, green: 0.24, blue: 0.21),
                highlight: Color(red: 0.32, green: 0.55, blue: 0.46)
            ),
            university: University(
                name: "University College London",
                shortName: "UCL",
                location: "London, UK",
                primary: Color(red: 0.07, green: 0.18, blue: 0.39),
                secondary: Color(red: 0.98, green: 0.76, blue: 0.33),
                emblem: .ucl
            )
        )
    ]
}
