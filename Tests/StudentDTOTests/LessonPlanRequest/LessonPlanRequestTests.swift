import StudentDTO
import XCTJSONKit

final class LessonPlanRequestTests: XCTestCase {
    let sut = try! LessonPlanRequest(
        id: "ID",
        status: .pending,
        instrument: Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B"),
        student: Student(
            name: "Alice",
            dateOfBirth: try DateOnly(year: 2021, month: 10, day: 29),
            about: "Lorem ipsum"
        ),
        address: Address(
            id: "ID",
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
        privateNote: "Something about Alice"
    )

    func testInit() throws {
        XCTAssertEqual(sut.id, "ID")
        XCTAssertEqual(sut.status, .pending)
        XCTAssertEqual(sut.instrument, Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B"))
        XCTAssertEqual(sut.student, Student(
            name: "Alice",
            dateOfBirth: try DateOnly(year: 2021, month: 10, day: 29),
            about: "Lorem ipsum"
        ))
        XCTAssertEqual(sut.address, Address(
            id: "ID",
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
        ))
        XCTAssertEqual(sut.schedule, try LessonPlanRequestSchedule(
            start: DateOnly(year: 2021, month: 07, day: 21),
            time: TimeOnly(hour: 17, minute: 24),
            duration: Duration(hours: 2, minutes: 10, seconds: 5)
        ))
        XCTAssertEqual(sut.privateNote, "Something about Alice")
    }

    func testCodable() throws {
        try XCTAssertJSONCoding(sut)
    }
}
