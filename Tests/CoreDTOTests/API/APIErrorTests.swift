import CoreDTO
import XCTDTOKit

final class APIErrorTests: DTOTestCase {
    func testInit() {
        let apiError = APIError(description: "Lorem ipsum", reason: .known(.clientOutdated))
        XCTAssertEqual(apiError.description, "Lorem ipsum")
        XCTAssertEqual(apiError.reason, .known(.clientOutdated))
    }

    func testCodable() throws {
        try XCTAssertJSONCoding(APIError(description: "Lorem ipsum", reason: .known(.clientOutdated)))
        try XCTAssertJSONCoding(APIError(description: "Lorem ipsum", reason: nil))
    }

    func testDecodings() throws {
        try XCTAssertJSONDecoding(
            ["description": "Lorem ipsum", "reason": "CLIENT_OUTDATED"],
            APIError(description: "Lorem ipsum", reason: .known(.clientOutdated))
        )
        try XCTAssertJSONDecoding(
            ["description": "Lorem ipsum", "reason": "deadbeef"],
            APIError(description: "Lorem ipsum", reason: .unknown("deadbeef"))
        )
        try XCTAssertJSONDecoding(
            ["description": "Lorem ipsum", "reason": nil],
            APIError(description: "Lorem ipsum", reason: nil)
        )
    }
}
