import FoundationEncore

public typealias APIEvent = Knowable<KnownAPIEvent>

public enum KnownAPIEvent: String, APIEventProtocol {
    case lessonPlansChanged = "LESSON_PLANS_CHANGED"
}
