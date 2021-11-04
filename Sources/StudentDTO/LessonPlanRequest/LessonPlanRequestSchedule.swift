import FoundationEncore

extension LessonPlanRequest {
    public typealias Schedule = LessonPlanRequestSchedule
}

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

extension LessonPlanRequestSchedule {
    public enum ValidDuration {
        public static var fortyFiveMinutes: Duration { .init(minutes: 45) }
        public static var sixtyMinutes: Duration { .init(minutes: 60) }
        public static var ninetyMinutes: Duration { .init(minutes: 90) }

        @ArrayBuilder<Duration>
        public static var all: [Duration] {
            fortyFiveMinutes
            sixtyMinutes
            ninetyMinutes
        }
    }
}
