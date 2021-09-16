import Foundation

public struct SIWABody: Codable {
    /// The user's full name.
    public let name: String?
    /// The JWT token.
    public let jwt: String
    /// Info about the app client.
    public let clientInfo: ClientInfo

    public init(name: String?, jwt: String, clientInfo: ClientInfo) {
        self.name = name
        self.jwt = jwt
        self.clientInfo = clientInfo
    }
}

extension SIWABody {
    public struct ClientInfo: Codable {
        public let deviceBrand: String
        public let deviceModel: String

        public let osName: String
        public let osVersion: String

        public let clientID: String
        public let clientVersion: String
        public let clientBuild: String?

        public init(
            deviceBrand: String,
            deviceModel: String,
            osName: String,
            osVersion: String,
            clientID: String,
            clientVersion: String,
            clientBuild: String?
        ) {
            self.deviceBrand = deviceBrand
            self.deviceModel = deviceModel
            self.osName = osName
            self.osVersion = osVersion
            self.clientID = clientID
            self.clientVersion = clientVersion
            self.clientBuild = clientBuild
        }
    }
}
