import TutorDTO
import XCTJSONKit

final class StudentTests: XCTestCase {
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
