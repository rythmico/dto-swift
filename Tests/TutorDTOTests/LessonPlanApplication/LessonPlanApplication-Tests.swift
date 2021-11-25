import TutorDTO
import XCTJSONKit

final class LessonPlanApplicationTests: XCTestCase {
    let sut = LessonPlanApplication(
        id: "APPLICATION_ID",
        status: .pending,
        createdAt: "2021-11-25T13:25:00Z",
        request: LessonPlanRequest(
            id: "REQUEST_ID",
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
                start: "2021-07-21",
                time: "17:24",
                duration: .init(hours: 2, minutes: 10, seconds: 5)
            ),
            privateNote: "REQUEST_PRIVATE_NOTE"
        ),
        privateNote: "APPLICATION_PRIVATE_NOTE"
    )

    func testInit() throws {
        XCTAssertEqual(sut.id, "APPLICATION_ID")
        XCTAssertEqual(sut.status, .pending)
        XCTAssertEqual(sut.createdAt, "2021-11-25T13:25:00Z")
        XCTAssertEqual(sut.privateNote, "APPLICATION_PRIVATE_NOTE")
    }

    // TODO: unit test all Codable status scenarios
    func testCodable() throws {
        try XCTAssertJSONCoding(sut)
    }
}
