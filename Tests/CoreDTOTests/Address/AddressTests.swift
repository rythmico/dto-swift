import CoreDTO
import XCTDTOKit

final class AddressTests: DTOTestCase {
    let sut = Address(
        id: "ID",
        latitude: 1,
        longitude: 2,
        line1: "A",
        line2: "B",
        line3: "C",
        line4: "D",
        district: "E",
        city: "F",
        state: "G",
        postcode: "H",
        country: "I"
    )

    func testInit() throws {
        XCTAssertEqual(sut.id, "ID")
        XCTAssertEqual(sut.latitude, 1)
        XCTAssertEqual(sut.longitude, 2)
        XCTAssertEqual(sut.line1, "A")
        XCTAssertEqual(sut.line2, "B")
        XCTAssertEqual(sut.line3, "C")
        XCTAssertEqual(sut.line4, "D")
        XCTAssertEqual(sut.district, "E")
        XCTAssertEqual(sut.city, "F")
        XCTAssertEqual(sut.state, "G")
        XCTAssertEqual(sut.postcode, "H")
        XCTAssertEqual(sut.country, "I")
    }

    func testJSONCoding() throws {
        try XCTAssertJSONCoding(sut)
    }
}
