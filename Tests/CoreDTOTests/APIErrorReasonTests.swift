import CoreDTO
import XCTJSONKit

final class APIErrorReasonTests: XCTestCase {
    private enum Reason: String, APIErrorReason {
        case foo
        case bar
        case unknown
    }

    func testJSONDecoding() throws {
        try XCTAssertJSONDecoding("foo", Reason.foo)
        try XCTAssertJSONDecoding("bar", Reason.bar)
        try XCTAssertJSONDecoding("unknown", Reason.unknown)
        try XCTAssertJSONDecoding("deadbeef", Reason.unknown)
    }

    func testJSONEncoding() throws {
        try XCTAssertJSONEncoding(Reason.foo, "foo")
        try XCTAssertJSONEncoding(Reason.bar, "bar")
        try XCTAssertJSONEncoding(Reason.unknown, "unknown")
    }
}
