import TutorDTO
import XCTJSONKit

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

    func testCodable() throws {
        let sut = try LessonPlanRequestSchedule(
            start: DateOnly(year: 2021, month: 07, day: 21),
            time: TimeOnly(hour: 17, minute: 24),
            duration: Duration(hours: 2, minutes: 10, seconds: 5)
        )
        try XCTAssertJSONCoding(sut)
    }
}
