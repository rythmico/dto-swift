import Foundation

public enum APIErrorReason: String, APIErrorReasonProtocol, CaseIterable {
    case clientOutdated = "APP_OUTDATED" // TODO: update to "CLIENT_OUTDATED" after backend migration.
    case unknown = "UNKNOWN"
}

public protocol APIErrorReasonProtocol: Codable, Equatable, RawRepresentable where RawValue == String {
    static var clientOutdated: Self { get }
    static var unknown: Self { get }
}

extension APIErrorReasonProtocol {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .unknown
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
