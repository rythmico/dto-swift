import Foundation

public protocol APIErrorReasonProtocol: RawRepresentable, Codable, Equatable where RawValue == String {
    static var clientOutdated: Self { get }
    static var unauthorized: Self { get }
}

public enum APIErrorReason: String, APIErrorReasonProtocol, CaseIterable {
    case clientOutdated = "CLIENT_OUTDATED"
    case unauthorized = "UNAUTHORIZED"
}
