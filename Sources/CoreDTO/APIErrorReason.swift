import Foundation

public enum APIErrorReason: String, APIErrorReasonProtocol, CaseIterable {
    case unknown = "UNKNOWN"
    case clientOutdated = "APP_OUTDATED" // TODO: update to "CLIENT_OUTDATED" after backend migration.
}

public protocol APIErrorReasonProtocol: Codable, Equatable, RawRepresentable where RawValue == String {
    static var unknown: Self { get }
    static var clientOutdated: Self { get }
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
