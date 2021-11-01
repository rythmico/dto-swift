import FoundationEncore

public struct Instrument: Codable, Hashable, Identifiable {
    public typealias ID = Knowable<KnownID>

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
