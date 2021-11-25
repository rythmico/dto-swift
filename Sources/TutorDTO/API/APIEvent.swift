import FoundationEncore

public typealias APIEvent = Knowable<KnownAPIEvent>

public enum KnownAPIEvent: String, APIEventProtocol {
    case lessonPlanRequestsChanged = "LESSON_PLAN_REQUESTS_CHANGED"
    case lessonPlanApplicationsChanged = "LESSON_PLAN_APPLICATIONS_CHANGED"
}
