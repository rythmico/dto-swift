import FoundationEncore

public struct APIClientInfo {
    public var id: String
    public var version: Version
    public var build: UInt

    public init(id: String, version: Version, build: UInt) {
        self.id = id
        self.version = version
        self.build = build
    }
}

extension APIClientInfo {
    public enum HTTPHeaderName {
        public static let id = "Client-ID"
        public static let version = "Client-Version"
        public static let build = "Client-Build"
    }
}
