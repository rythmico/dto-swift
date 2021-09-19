import Foundation

public struct APIError<Reason: APIErrorReason>: Codable, Equatable, LocalizedError {
    public var description: String
    public var reason: Reason?

    public init(description: String, reason: Reason?) {
        self.description = description
        self.reason = reason
    }
}

extension APIError {
    public var errorDescription: String? { description }
}
