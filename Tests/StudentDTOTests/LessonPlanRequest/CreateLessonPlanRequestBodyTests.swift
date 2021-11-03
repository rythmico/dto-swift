import StudentDTO
import XCTJSONKit

final class CreateLessonPlanRequestBodyTests: XCTestCase {
    let sut = try! CreateLessonPlanRequestBody(
        instrument: .known(.guitar),
        student: Student(
            name: "David",
            dateOfBirth: DateOnly(year: 1997, month: 07, day: 03),
            about: "Lorem ipsum"
        ),
        address: AddressLookupItem(
            latitude: 1,
            longitude: 2,
            line1: "A",
            line2: "B",
            line3: "C",
            line4: "D",
            district: "E",
            city: "F",
            state: "G",
            postcode: "H",
            country: "I"
        ),
        schedule: LessonPlanRequestSchedule(
            start: DateOnly(year: 2021, month: 07, day: 21),
            time: TimeOnly(hour: 17, minute: 24),
            duration: Duration(hours: 2, minutes: 10, seconds: 5)
        ),
        privateNote: "Dolor sit"
    )

    func testCodable() throws {
        try XCTAssertJSONCoding(sut)
    }
}
