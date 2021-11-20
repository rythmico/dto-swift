import Foundation

public struct RegisterAPNSTokenBody: Codable, Equatable {
    public enum Environment: String, Codable, Equatable {
        case sandbox
        case production
    }

    public var deviceToken: String
    public var environment: Environment

    public init(deviceToken: String, environment: Environment) {
        self.deviceToken = deviceToken
        self.environment = environment
    }
}
