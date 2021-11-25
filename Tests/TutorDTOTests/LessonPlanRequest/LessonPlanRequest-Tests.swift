import TutorDTO
import XCTJSONKit

final class LessonPlanRequestTests: XCTestCase {
    let sut = try! LessonPlanRequest(
        id: "SELF_ID",
        submitterName: "SUBMITTER_NAME",
        instrument: Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B"),
        student: LessonPlanRequestPartialStudent(
            firstName: "FIRST_NAME",
            age: 24,
            about: "ABOUT"
        ),
        address: LessonPlanRequestPartialAddress(
            latitude: 123,
            longitude: 456,
            district: "DISTRICT",
            districtCode: "DISTRICT_CODE"
        ),
        schedule: LessonPlanRequestSchedule(
            start: DateOnly(year: 2021, month: 07, day: 21),
            time: TimeOnly(hour: 17, minute: 24),
            duration: Duration(hours: 2, minutes: 10, seconds: 5)
        ),
        privateNote: "PRIVATE_NOTE"
    )

    func testInit() throws {
        XCTAssertEqual(sut.id, "SELF_ID")
        XCTAssertEqual(sut.submitterName, "SUBMITTER_NAME")
        XCTAssertEqual(sut.instrument, Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B"))
        XCTAssertEqual(sut.student, LessonPlanRequestPartialStudent(
            firstName: "FIRST_NAME",
            age: 24,
            about: "ABOUT"
        ))
        XCTAssertEqual(sut.address, LessonPlanRequestPartialAddress(
            latitude: 123,
            longitude: 456,
            district: "DISTRICT",
            districtCode: "DISTRICT_CODE"
        ))
        XCTAssertEqual(sut.schedule, try LessonPlanRequestSchedule(
            start: DateOnly(year: 2021, month: 07, day: 21),
            time: TimeOnly(hour: 17, minute: 24),
            duration: Duration(hours: 2, minutes: 10, seconds: 5)
        ))
        XCTAssertEqual(sut.privateNote, "PRIVATE_NOTE")
    }

    // TODO: unit test all Codable status scenarios
    func testCodable() throws {
        try XCTAssertJSONCoding(sut)
    }
}
