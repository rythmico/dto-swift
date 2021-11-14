import FoundationEncore

extension LessonPlanRequest {
    public typealias PartialStudent = LessonPlanRequestPartialStudent
}

public struct LessonPlanRequestPartialStudent: Codable, Hashable {
    public var firstName: String
    public var age: Int
    public var about: String

    public init(
        firstName: String,
        age: Int,
        about: String
    ) {
        self.firstName = firstName
        self.age = age
        self.about = about
    }
}
