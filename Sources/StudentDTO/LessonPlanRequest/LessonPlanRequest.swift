import FoundationEncore

public struct LessonPlanRequest: Codable, Hashable, Identifiable {
    public typealias ID = Tagged<Self, String>
    public typealias Schedule = LessonPlanRequestSchedule

    public var id: ID
    public var status: Status
    public var instrument: Instrument
    public var student: Student
    public var address: Address
    public var schedule: Schedule
    public var privateNote: String

    public init(
        id: ID,
        status: Status,
        instrument: Instrument,
        student: Student,
        address: Address,
        schedule: Schedule,
        privateNote: String
    ) {
        self.id = id
        self.status = status
        self.instrument = instrument
        self.student = student
        self.address = address
        self.schedule = schedule
        self.privateNote = privateNote
    }
}

extension LessonPlanRequest {
    public enum Status: Codable, Hashable {
        case pending
        // TODO
//        case reviewing
//        case completed
//        case withdrawn

        public init(from decoder: Decoder) throws {
            self = .pending
        }

        public func encode(to encoder: Encoder) throws {

        }
    }
}
