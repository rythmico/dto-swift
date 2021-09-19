import Foundation

public enum APIErrorReason: String, CoreDTO.APIErrorReason {
    case unknown = "UNKNOWN"
    case clientOutdated = "APP_OUTDATED" // TODO: update to "CLIENT_OUTDATED" after backend migration.
    case tutorNotVerified = "TUTOR_NOT_VERIFIED"
}
