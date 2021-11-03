import FoundationEncore

public struct CreateLessonPlanRequestBody: Codable, Hashable {
    public var instrument: Instrument.ID
    public var student: Student
    public var address: AddressLookupItem
    public var schedule: LessonPlanRequestSchedule
    public var privateNote: String

    public init(
        instrument: Instrument.ID,
        student: Student,
        address: AddressLookupItem,
        schedule: LessonPlanRequestSchedule,
        privateNote: String
    ) {
        self.instrument = instrument
        self.student = student
        self.address = address
        self.schedule = schedule
        self.privateNote = privateNote
    }
}
