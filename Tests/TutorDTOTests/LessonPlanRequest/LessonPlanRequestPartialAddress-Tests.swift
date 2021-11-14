import TutorDTO
import XCTJSONKit

final class LessonPlanRequestPartialAddressTests: XCTestCase {
    func testInit() throws {
        let sut = LessonPlanRequestPartialAddress(
            latitude: 123,
            longitude: 456,
            district: "DISTRICT",
            districtCode: "DISTRICT_CODE"
        )
        XCTAssertEqual(sut.latitude, 123)
        XCTAssertEqual(sut.longitude, 456)
        XCTAssertEqual(sut.district, "DISTRICT")
        XCTAssertEqual(sut.districtCode, "DISTRICT_CODE")
    }

    func testCodable() throws {
        let sut = LessonPlanRequestPartialAddress(
            latitude: 123,
            longitude: 456,
            district: "DISTRICT",
            districtCode: "DISTRICT_CODE"
        )
        try XCTAssertJSONCoding(sut)
    }
}
