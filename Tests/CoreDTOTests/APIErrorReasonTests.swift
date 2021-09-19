import CoreDTO
import XCTJSONKit

final class APIErrorReasonTests: XCTestCase {
    private enum Reason: String, APIErrorReason {
        case foo
        case bar
        case unknown
    }

    func testJSONDecoding() throws {
        try XCTAssertJSONDecoding(JSON("foo"), Reason.foo)
        try XCTAssertJSONDecoding(JSON("bar"), Reason.bar)
        try XCTAssertJSONDecoding(JSON("unknown"), Reason.unknown)
        try XCTAssertJSONDecoding(JSON("deadbeef"), Reason.unknown)
    }

    func testJSONEncoding() throws {
        try XCTAssertJSONEncoding(Reason.foo, JSON("foo"))
        try XCTAssertJSONEncoding(Reason.bar, JSON("bar"))
        try XCTAssertJSONEncoding(Reason.unknown, JSON("unknown"))
    }
}
