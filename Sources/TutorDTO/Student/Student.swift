import Foundation

public struct Student: Codable, Hashable {
    public var name: String
    public var age: Int
    public var about: String

    public init(
        name: String,
        age: Int,
        about: String
    ) {
        self.name = name
        self.age = age
        self.about = about
    }
}
