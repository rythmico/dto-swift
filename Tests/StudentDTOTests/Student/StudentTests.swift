import StudentDTO
import XCTDTOKit

final class StudentTests: DTOTestCase {
    func testInit() throws {
        let sut = Student(
            name: "Alice",
            dateOfBirth: try DateOnly(year: 2021, month: 10, day: 29),
            about: "Lorem ipsum"
        )
        XCTAssertEqual(sut.name, "Alice")
        XCTAssertEqual(sut.dateOfBirth, try DateOnly(year: 2021, month: 10, day: 29))
        XCTAssertEqual(sut.about, "Lorem ipsum")
    }

    func testCodable() throws {
        let sut = Student(
            name: "Alice",
            dateOfBirth: try DateOnly(year: 2021, month: 10, day: 29),
            about: "Lorem ipsum"
        )
        try XCTAssertJSONCoding(sut)
    }
}
