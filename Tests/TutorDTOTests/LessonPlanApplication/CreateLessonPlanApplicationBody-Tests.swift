import TutorDTO
import XCTJSONKit

final class CreateLessonPlanApplicationBodyTests: XCTestCase {
    let sut = CreateLessonPlanApplicationBody(
        requestID: "REQUEST_ID",
        privateNote: "Lorem ipsum"
    )

    func testInit() {
        XCTAssertEqual(sut.requestID, "REQUEST_ID")
        XCTAssertEqual(sut.privateNote, "Lorem ipsum")
    }

    func testCodable() throws {
        try XCTAssertJSONCoding(sut)
    }
}
