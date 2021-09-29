import CoreDTO
import CustomDump
import XCTest

final class APIClientInfoTests: XCTestCase {
    func testEncodeAsHTTPHeaders() throws {
        let sut = APIClientInfo.ID.allCases.map {
            APIClientInfo(
                id: $0,
                version: Version(1, 0, 0),
                build: 123
            )
        }
        .map { $0.encodeAsHTTPHeaders() }

        XCTAssertNoDifference(sut, [
            [
                "Client-ID": "com.rythmico.student",
                "Client-Version": "1.0.0",
                "Client-Build": "123",
            ],
            [
                "Client-ID": "com.rythmico.tutor",
                "Client-Version": "1.0.0",
                "Client-Build": "123",
            ],
        ])
    }
}
