import Foundation

public enum APIEvent: String, APIEventProtocol {
    case unknown = "UNKNOWN"
    case bookingRequestsChanged = "BOOKING_REQUESTS_CHANGED"
    case bookingApplicationsChanged = "BOOKING_APPLICATIONS_CHANGED"
}
