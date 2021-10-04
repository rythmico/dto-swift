import Foundation

public struct SIWAResponse: Codable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
