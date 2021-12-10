import TutorDTO
import XCTDTOKit

final class LessonPlanRequestPartialStudentTests: DTOTestCase {
    func testInit() throws {
        let sut = LessonPlanRequestPartialStudent(
            firstName: "David",
            age: 24,
            about: "Something about David"
        )
        XCTAssertEqual(sut.firstName, "David")
        XCTAssertEqual(sut.age, 24)
        XCTAssertEqual(sut.about, "Something about David")
    }

    func testCodable() throws {
        let sut = LessonPlanRequestPartialStudent(
            firstName: "David",
            age: 24,
            about: "Something about David"
        )
        try XCTAssertJSONCoding(sut)
    }
}
