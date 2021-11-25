import FoundationEncore

public struct CreateLessonPlanApplicationBody: Codable, Hashable {
    public var requestID: LessonPlanRequest.ID
    public var privateNote: String

    public init(
        requestID: LessonPlanRequest.ID,
        privateNote: String
    ) {
        self.requestID = requestID
        self.privateNote = privateNote
    }
}
