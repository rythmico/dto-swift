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
            JSON(["description": "Lorem ipsum", "reason": "foobaz"]),
            APIError(description: "Lorem ipsum", reason: .unknown)
        )
    }
}
