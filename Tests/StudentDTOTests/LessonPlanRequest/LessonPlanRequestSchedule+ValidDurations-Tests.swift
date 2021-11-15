import StudentDTO
import XCTest

final class LessonPlanRequestSchedule_ValidDurationsTests: XCTestCase {
    func testValidDurations() throws {
        XCTAssertEqual(LessonPlanRequestSchedule.ValidDuration.fortyFiveMinutes, Duration(minutes: 45))
        XCTAssertEqual(LessonPlanRequestSchedule.ValidDuration.sixtyMinutes, Duration(minutes: 60))
        XCTAssertEqual(LessonPlanRequestSchedule.ValidDuration.ninetyMinutes, Duration(minutes: 90))
        XCTAssertEqual(LessonPlanRequestSchedule.ValidDuration.all, [
            Duration(minutes: 45),
            Duration(minutes: 60),
            Duration(minutes: 90),
        ])
    }
}
