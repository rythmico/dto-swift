import CoreDTO
import XCTJSONKit

final class APIErrorTests: XCTestCase {
    private enum Reason: String, APIErrorReason {
        case foo
        case bar
        case unknown
    }

    private typealias APIError = CoreDTO.APIError<Reason>

    func testInit() {
        let apiError = APIError(description: "Lorem ipsum", reason: .bar)

        XCTAssertEqual(apiError.description, "Lorem ipsum")
        XCTAssertEqual(apiError.errorDescription, "Lorem ipsum")
        XCTAssertEqual(apiError.localizedDescription, "Lorem ipsum")

        XCTAssertEqual(apiError.reason, .bar)
        XCTAssertEqual(apiError.failureReason, nil)

        XCTAssertEqual(apiError.recoverySuggestion, nil)
        XCTAssertEqual(apiError.helpAnchor, nil)
    }

    func testCodable() throws {
        try XCTAssertJSONCoding(APIError(description: "Lorem ipsum", reason: .bar))
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
            ["errorDescription": "Lorem ipsum", "errorType": "foo"],
            APIError(description: "Lorem ipsum", reason: .foo)
        )
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "errorType": "foobaz"],
            APIError(description: "Lorem ipsum", reason: .unknown)
        )
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "errorType": nil],
            APIError(description: "Lorem ipsum", reason: nil)
        )

        // Mixed
        try XCTAssertJSONDecoding(
            ["description": "Lorem ipsum", "errorType": "foo"],
            APIError(description: "Lorem ipsum", reason: .foo)
        )
        try XCTAssertJSONDecoding(
            ["errorDescription": "Lorem ipsum", "reason": "foo"],
            APIError(description: "Lorem ipsum", reason: .foo)
        )
    }
}
