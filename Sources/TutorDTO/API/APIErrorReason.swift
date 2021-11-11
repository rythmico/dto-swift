import Foundation

public enum APIErrorReason: String, CoreDTO.APIErrorReasonProtocol {
    case clientOutdated = "CLIENT_OUTDATED"
    case unauthorized = "UNAUTHORIZED"

    case tutorProfileNotCreated = "TUTOR_PROFILE_NOT_CREATED"
}
