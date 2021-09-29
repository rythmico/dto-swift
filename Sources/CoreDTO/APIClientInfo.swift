import FoundationEncore

public struct APIClientInfo {
    public enum ID: String, CaseIterable {
        case student = "com.rythmico.student"
        case tutor = "com.rythmico.tutor"
    }

    public var id: ID
    public var version: Version
    public var build: UInt

    public init(id: ID, version: Version, build: UInt) {
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

    public func encodeAsHTTPHeaders() -> [String: String] {[
        HTTPHeaderName.id: id.rawValue,
        HTTPHeaderName.version: String(version),
        HTTPHeaderName.build: String(build),
    ]}
}
