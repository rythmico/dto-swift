import Foundation

public protocol APIEventProtocol: RawRepresentable, Codable, Equatable where RawValue == String {}
