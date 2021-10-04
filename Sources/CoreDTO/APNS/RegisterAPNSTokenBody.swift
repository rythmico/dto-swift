import Foundation

public struct RegisterAPNSTokenBody: Codable {
    public var deviceToken: String

    public init(deviceToken: String) {
        self.deviceToken = deviceToken
    }
}
