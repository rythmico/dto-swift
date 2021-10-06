import StudentDTO
import TutorDTO
import XCTest

final class APIEventTests: XCTestCase {
    func testConsistentUnknownRawValues() {
        XCTAssertEqual(
            StudentDTO.APIEvent.unknown.rawValue,
            TutorDTO.APIEvent.unknown.rawValue
        )
    }
}
