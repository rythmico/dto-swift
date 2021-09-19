import Foundation

public enum APIErrorReason: String, CoreDTO.APIErrorReason {
    case unknown = "UNKNOWN"
    case clientOutdated = "APP_OUTDATED"
}
