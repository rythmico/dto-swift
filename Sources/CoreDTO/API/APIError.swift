import FoundationEncore

public typealias APIError = APIErrorOf<APIErrorReason>

public struct APIErrorOf<Reason: APIErrorReasonProtocol>: Codable, Equatable {
    public var description: String
    public var reason: Knowable<Reason>?

    public init(description: String, reason: Knowable<Reason>?) {
        self.description = description
        self.reason = reason
    }
}
