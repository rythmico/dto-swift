import Foundation

public struct SIWAResponse: Codable {
    public let userID: String
    public let accessToken: String

    public init(userID: String, accessToken: String) {
        self.userID = userID
        self.accessToken = accessToken
    }
}
