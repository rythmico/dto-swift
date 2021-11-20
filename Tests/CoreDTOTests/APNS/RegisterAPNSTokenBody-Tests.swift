import CoreDTO
import XCTJSONKit

final class RegisterAPNSTokenBodyTests: XCTestCase {
    func testInit() {
        RegisterAPNSTokenBody(deviceToken: "DEVICE_TOKEN", environment: .sandbox) => { sut in
            XCTAssertEqual(sut.deviceToken, "DEVICE_TOKEN")
            XCTAssertEqual(sut.environment, .sandbox)
        }
        RegisterAPNSTokenBody(deviceToken: "DEVICE_TOKEN", environment: .production) => { sut in
            XCTAssertEqual(sut.deviceToken, "DEVICE_TOKEN")
            XCTAssertEqual(sut.environment, .production)
        }
    }

    func testCodable() throws {
        try RegisterAPNSTokenBody(deviceToken: "DEVICE_TOKEN", environment: .sandbox) => { sut in
            try XCTAssertJSONCoding(sut)
        }
        try RegisterAPNSTokenBody(deviceToken: "DEVICE_TOKEN", environment: .production) => { sut in
            try XCTAssertJSONCoding(sut)
        }
    }
}

final class RegisterAPNSTokenBodyEnvironmentTests: XCTestCase {
    func testEncodable() throws {
        try XCTAssertJSONEncoding(RegisterAPNSTokenBody.Environment.sandbox, "sandbox")
        try XCTAssertJSONEncoding(RegisterAPNSTokenBody.Environment.production, "production")
    }

    func testDecodable() throws {
        try XCTAssertJSONDecoding("sandbox", RegisterAPNSTokenBody.Environment.sandbox)
        try XCTAssertJSONDecoding("production", RegisterAPNSTokenBody.Environment.production)
    }
}
