import Foundation

public struct SIWABody: Codable {
    /// The user's full name.
    public let name: String?
    /// The JWT token.
    public let jwt: String

    public init(name: String?, jwt: String) {
        self.name = name
        self.jwt = jwt
    }
}
