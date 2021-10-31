import Foundation

public struct Instrument: Codable, Hashable, Identifiable {
    /// An ID (known by server, maybe unknown by client)
    public var id: ID
    /// Standalone noun.
    /// e.g. "Drums".
    public var standaloneName: String
    /// Noun to be joined with other nouns.
    /// e.g. "Drum lessons", "Drum tutor".
    public var assimilatedName: String

    public init(
        id: ID,
        standaloneName: String,
        assimilatedName: String
    ) {
        self.id = id
        self.standaloneName = standaloneName
        self.assimilatedName = assimilatedName
    }

    public init(
        id: KnownID,
        standaloneName: String,
        assimilatedName: String
    ) {
        self.init(
            id: .known(id),
            standaloneName: standaloneName,
            assimilatedName: assimilatedName
        )
    }
}

extension Instrument {
    public enum ID {
        case known(KnownID)
        case unknown(String)
    }

    public enum KnownID: String, CaseIterable, Codable {
        case guitar = "GUITAR"
        case drums = "DRUMS"
        case piano = "PIANO"
        case singing = "SINGING"
        case bassGuitar = "BASS_GUITAR"
        case saxophone = "SAXOPHONE"
        case trumpet = "TRUMPET"
        case flute = "FLUTE"
        case violin = "VIOLIN"
        case harp = "HARP"
    }
}

extension Instrument.ID {
    init(rawValue: String) {
        self = Instrument.KnownID(rawValue: rawValue).map(Self.known) ?? .unknown(rawValue)
    }

    public var rawValue: String {
        switch self {
        case .known(let knownID):
            return knownID.rawValue
        case .unknown(let rawValue):
            return rawValue
        }
    }
}

extension Instrument.ID: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

extension Instrument.ID: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}

extension Instrument.ID: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

extension Instrument.ID: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
