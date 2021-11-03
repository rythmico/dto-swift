import StudentDTO
import XCTest

final class LessonPlanRequestScheduleTests: XCTestCase {
    func testInit() throws {
        let sut = try LessonPlanRequestSchedule(
            start: DateOnly(year: 2021, month: 07, day: 21),
            time: TimeOnly(hour: 17, minute: 24),
            duration: Duration(hours: 2, minutes: 10, seconds: 5)
        )
        XCTAssertEqual(sut.start, try DateOnly(year: 2021, month: 07, day: 21))
        XCTAssertEqual(sut.time, try TimeOnly(hour: 17, minute: 24))
        XCTAssertEqual(sut.duration, Duration(hours: 2, minutes: 10, seconds: 5))
    }

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
