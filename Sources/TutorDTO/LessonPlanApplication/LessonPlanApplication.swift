import FoundationEncore

public struct LessonPlanApplication: Codable, Hashable, Identifiable {
    public typealias ID = Tagged<Self, String>

    public var id: ID
    public var createdAt: Date
    public var request: LessonPlanRequest
    public var privateNote: String

    public var retractedAt: Date?
//    public var notSelectedAt: Date?
//    public var plan: LessonPlan?
}

extension LessonPlanApplication {
    public enum Status: Hashable {
        case pending
//        case cancelled(LessonPlanRequest.CancellationInfo)
        case retracted(Date)
//        case notSelected(Date)
//        case selected(LessonPlan)
    }

    public var status: Status {
        get {
            switch (retractedAt) {
            case (let retractedAt?):
                return .retracted(retractedAt)
            case (nil):
                return .pending
            }
        }
        set {
            self.retractedAt = (/Status.retracted).extract(from: newValue)
        }
    }

    public init(
        id: ID,
        createdAt: Date,
        request: LessonPlanRequest,
        privateNote: String,
        status: Status
    ) {
        self.init(
            id: id,
            createdAt: createdAt,
            request: request,
            privateNote: privateNote,
            retractedAt: (/Status.retracted).extract(from: status)
        )
    }
}
