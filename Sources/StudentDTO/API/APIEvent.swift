import Foundation

public enum APIEvent: String, APIEventProtocol {
    case unknown = "UNKNOWN"
    case lessonPlansChanged = "LESSON_PLANS_CHANGED"
}
