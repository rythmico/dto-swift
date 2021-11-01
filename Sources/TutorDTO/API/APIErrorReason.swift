import Foundation

public enum APIErrorReason: String, CoreDTO.APIErrorReasonProtocol {
    case clientOutdated = "CLIENT_OUTDATED"
    case unauthorized = "UNAUTHORIZED"
    case tutorNotVerified = "TUTOR_NOT_VERIFIED"
}
