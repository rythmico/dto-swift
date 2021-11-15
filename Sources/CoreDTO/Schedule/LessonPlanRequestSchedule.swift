import FoundationEncore

public struct LessonPlanRequestSchedule: Codable, Hashable {
    public var start: DateOnly
    public var time: TimeOnly
    public var duration: Duration

    public init(
        start: DateOnly,
        time: TimeOnly,
        duration: Duration
    ) {
        self.start = start
        self.time = time
        self.duration = duration
    }
}
