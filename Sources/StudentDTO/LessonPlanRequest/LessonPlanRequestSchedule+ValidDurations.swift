import FoundationEncore

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
