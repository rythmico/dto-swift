import CoreDTO
import XCTJSONKit

final class APIErrorTests: XCTestCase {
    func testInit() {
        let apiError = APIError(description: "Lorem ipsum", reason: .clientOutdated)
        XCTAssertEqual(apiError.description, "Lorem ipsum")
        XCTAssertEqual(apiError.reason, .clientOutdated)
    }

    func testCodable() throws {
        try XCTAssertJSONCoding(APIError(description: "Lorem ipsum", reason: .clientOutdated))
        try XCTAssertJSONCoding(APIError(description: "Lorem ipsum", reason: nil))
    }

    func testDecoding_unknownReason() throws {
        try XCTAssertJSONDecoding(
            ["description": "Lorem ipsum", "reason": "foobaz"],
            APIError(description: "Lorem ipsum", reason: .unknown)
        )
    }

    func testDecoding_legacyAPIProperties() throws {
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "errorType": "APP_OUTDATED"],
            APIError(description: "Lorem ipsum", reason: .clientOutdated)
        )
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "errorType": "deadbeef"],
            APIError(description: "Lorem ipsum", reason: .unknown)
        )
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "errorType": nil],
            APIError(description: "Lorem ipsum", reason: nil)
        )

        // Mixed
        try XCTAssertJSONDecoding(
            ["description": "Lorem ipsum", "errorType": "APP_OUTDATED"],
            APIError(description: "Lorem ipsum", reason: .clientOutdated)
        )
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "reason": "APP_OUTDATED"],
            APIError(description: "Lorem ipsum", reason: .clientOutdated)
        )
    }
}
