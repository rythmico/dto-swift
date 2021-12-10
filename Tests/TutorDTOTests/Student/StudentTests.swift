import TutorDTO
import XCTDTOKit

final class StudentTests: DTOTestCase {
    func testInit() {
        let sut = Student(
            name: "Alice",
            age: 9,
            about: "Lorem ipsum"
        )
        XCTAssertEqual(sut.name, "Alice")
        XCTAssertEqual(sut.age, 9)
        XCTAssertEqual(sut.about, "Lorem ipsum")
    }

    func testCodable() throws {
        let sut = Student(
            name: "Alice",
            age: 9,
            about: "Lorem ipsum"
        )
        try XCTAssertJSONCoding(sut)
    }
}
