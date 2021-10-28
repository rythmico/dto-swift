import FoundationEncore

public struct Student: Codable, Hashable {
    public var name: String
    public var dateOfBirth: DateOnly
    public var about: String

    public init(
        name: String,
        dateOfBirth: DateOnly,
        about: String
    ) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.about = about
    }
}
