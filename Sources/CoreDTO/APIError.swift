import Foundation

public struct APIError<Reason: APIErrorReason>: Codable, Equatable {
    public var description: String
    public var reason: Reason?

    public init(description: String, reason: Reason?) {
        self.description = description
        self.reason = reason
    }
}

// TODO: remove after backend migration.
// Below is all backwards-compatibility support.
extension APIError {
    private enum CodingKeys: String, CodingKey {
        case description
        case reason

        case errorDescription
        case errorType
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try self.init(
            description: container.decodeIfPresent(String.self, forKey: .description) ?? container.decode(String.self, forKey: .errorDescription),
            reason: container.decodeIfPresent(Reason.self, forKey: .reason) ?? container.decodeIfPresent(Reason.self, forKey: .errorType)
        )
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(description, forKey: .description)
        try container.encode(reason, forKey: .reason)
    }
}
