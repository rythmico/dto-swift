import FoundationEncore

public struct APIClientInfo: Hashable {
    public enum ID: String, CaseIterable, Hashable {
        case student = "com.rythmico.student"
        case tutor = "com.rythmico.tutor"
    }

    public var id: ID
    public var version: Version
    public var build: UInt

    public var device: String
    public var os: String

    public init(
        id: ID,
        version: Version,
        build: UInt,
        device: String,
        os: String
    ) {
        self.id = id
        self.version = version
        self.build = build
        self.device = device
        self.os = os
    }
}

extension APIClientInfo {
    public enum HTTPHeaderName {
        public static let id = "Client-ID"
        public static let version = "Client-Version"
        public static let build = "Client-Build"

        public static let deviceModel = "Client-Device-Model"
        public static let deviceOS = "Client-Device-OS"
    }

    public func encodeAsHTTPHeaders() -> [String: String] {[
        HTTPHeaderName.id: id.rawValue,
        HTTPHeaderName.version: String(version),
        HTTPHeaderName.build: String(build),

        HTTPHeaderName.deviceModel: String(device),
        HTTPHeaderName.deviceOS: String(os),
    ]}
}
