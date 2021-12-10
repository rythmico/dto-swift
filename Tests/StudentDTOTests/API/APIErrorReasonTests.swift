import StudentDTO
import XCTDTOKit

final class APIErrorReasonTests: DTOTestCase {
    func testConsistentCoreReasonsRawValues() {
        for coreReason in CoreDTO.APIErrorReason.allCases {
            let sut = StudentDTO.APIErrorReason(rawValue: coreReason.rawValue)
            XCTAssertEqual(sut?.rawValue, coreReason.rawValue)
        }
    }
}
