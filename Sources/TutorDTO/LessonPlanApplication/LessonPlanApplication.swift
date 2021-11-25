import FoundationEncore

public struct LessonPlanApplication: Hashable, Identifiable {
    public typealias ID = Tagged<Self, String>

    public var id: ID
    public var status: Status
    public var createdAt: Date
    public var request: LessonPlanRequest
    public var privateNote: String

    public init(
        id: ID,
        status: Status,
        createdAt: Date,
        request: LessonPlanRequest,
        privateNote: String
    ) {
        self.id = id
        self.status = status
        self.createdAt = createdAt
        self.request = request
        self.privateNote = privateNote
    }
}

extension LessonPlanApplication {
    public enum Status: Hashable {
        case pending
//        case cancelled(LessonPlanRequest.CancellationInfo)
//        case retracted(Date)
//        case notSelected(Date)
//        case selected(LessonPlan)
    }
}

extension LessonPlanApplication: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(ID.self, forKey: .id),
            status: try Status(from: decoder),
            createdAt: try container.decode(Date.self, forKey: .createdAt),
            request: try container.decode(LessonPlanRequest.self, forKey: .request),
            privateNote: try container.decode(String.self, forKey: .privateNote)
        )
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case request
        case privateNote
    }
}

extension LessonPlanApplication.Status: Codable {
    public init(from decoder: Decoder) throws {
        self = .pending // TODO
    }

    public func encode(to encoder: Encoder) throws {
        // TODO
    }

    private enum CodingKeys: String, CodingKey {
        case request
        case retractedAt
        case notSelectedAt
        case plan
    }
}
