import FoundationEncore

public typealias APIEvent = Knowable<KnownAPIEvent>

public enum KnownAPIEvent: String, APIEventProtocol {
    case lessonPlanRequestsChanged = "LESSON_PLAN_REQUESTS_CHANGED"
    case bookingApplicationsChanged = "BOOKING_APPLICATIONS_CHANGED"
}
