import FoundationEncore

public protocol APIErrorReasonProtocol: Codable, Equatable, RawRepresentableWithUnknown where RawValue == String {
    static var unknown: Self { get }
    static var clientOutdated: Self { get }
    static var unauthorized: Self { get }
}

public enum APIErrorReason: String, APIErrorReasonProtocol, CaseIterable {
    case unknown = "UNKNOWN"
    case clientOutdated = "APP_OUTDATED" // TODO: update to "CLIENT_OUTDATED" after backend migration.
    case unauthorized = "UNAUTHORIZED"
}
