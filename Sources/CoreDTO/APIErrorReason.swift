import Foundation

public protocol APIErrorReason: Codable, Equatable, RawRepresentable where RawValue == String {
    static var unknown: Self { get }
}

extension APIErrorReason {
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
