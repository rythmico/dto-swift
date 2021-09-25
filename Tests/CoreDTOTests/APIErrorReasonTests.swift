import CoreDTO
import XCTJSONKit

final class APIErrorReasonTests: XCTestCase {
    func testJSONDecoding() throws {
        try XCTAssertJSONDecoding("APP_OUTDATED", APIErrorReason.clientOutdated)
        try XCTAssertJSONDecoding("UNKNOWN", APIErrorReason.unknown)
        try XCTAssertJSONDecoding("DEADBEEF", APIErrorReason.unknown)
    }

    func testJSONEncoding() throws {
        try XCTAssertJSONEncoding(APIErrorReason.clientOutdated, "APP_OUTDATED")
        try XCTAssertJSONEncoding(APIErrorReason.unknown, "UNKNOWN")
    }
}
