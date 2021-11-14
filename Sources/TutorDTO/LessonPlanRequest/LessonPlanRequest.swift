import FoundationEncore

public struct LessonPlanRequest: Codable, Hashable, Identifiable {
    public typealias ID = Tagged<Self, String>

    public var id: ID
    public var submitterName: String
    public var instrument: Instrument
    public var student: PartialStudent
    public var address: PartialAddress
    public var schedule: Schedule
    public var privateNote: String

    public init(
        id: ID,
        submitterName: String,
        instrument: Instrument,
        student: PartialStudent,
        address: PartialAddress,
        schedule: Schedule,
        privateNote: String
    ) {
        self.id = id
        self.submitterName = submitterName
        self.instrument = instrument
        self.student = student
        self.address = address
        self.schedule = schedule
        self.privateNote = privateNote
    }
}
