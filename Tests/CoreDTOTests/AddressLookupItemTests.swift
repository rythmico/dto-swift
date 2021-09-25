import CoreDTO
import XCTJSONKit

final class AddressLookupItemTests: XCTestCase {
    let sut = AddressLookupItem(latitude: 1, longitude: 2, line1: "A", line2: "B", line3: "C", line4: "D", city: "E", postcode: "F", country: "G")

    func testInit() throws {
        XCTAssertEqual(sut.latitude, 1)
        XCTAssertEqual(sut.longitude, 2)
        XCTAssertEqual(sut.line1, "A")
        XCTAssertEqual(sut.line2, "B")
        XCTAssertEqual(sut.line3, "C")
        XCTAssertEqual(sut.line4, "D")
        XCTAssertEqual(sut.city, "E")
        XCTAssertEqual(sut.postcode, "F")
        XCTAssertEqual(sut.country, "G")
    }

    func testJSONCoding() throws {
        try XCTAssertJSONCoding(sut)
    }
}
