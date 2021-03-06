import CoreDTO
import XCTDTOKit

final class APIClientInfoTests: DTOTestCase {
    func testEncodeAsHTTPHeaders() throws {
        let sut = APIClientInfo.ID.allCases.map {
            APIClientInfo(
                id: $0,
                version: Version(1, 0, 0),
                build: 123,
                device: "iPhone10,1",
                os: "iOS 15.0"
            )
        }
        .map { $0.encodeAsHTTPHeaders() }

        XCTAssertNoDifference(sut, [
            [
                "Client-ID": "com.rythmico.student",
                "Client-Version": "1.0.0",
                "Client-Build": "123",
                "Client-Device-Model": "iPhone10,1",
                "Client-Device-OS": "iOS 15.0",
            ],
            [
                "Client-ID": "com.rythmico.tutor",
                "Client-Version": "1.0.0",
                "Client-Build": "123",
                "Client-Device-Model": "iPhone10,1",
                "Client-Device-OS": "iOS 15.0",
            ],
        ])
    }
}
