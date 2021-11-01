import Foundation

public protocol APIErrorReasonProtocol: RawRepresentable, Codable, Equatable where RawValue == String {
    static var clientOutdated: Self { get }
    static var unauthorized: Self { get }
}

public enum APIErrorReason: String, APIErrorReasonProtocol, CaseIterable {
    case clientOutdated = "APP_OUTDATED" // TODO: update to "CLIENT_OUTDATED" after backend migration.
    case unauthorized = "UNAUTHORIZED"
}
