import TutorDTO
import XCTDTOKit

final class ProfileStatusTests: DTOTestCase {
    func testCodable() throws {
        try XCTAssertJSONCoding(ProfileStatus.registrationPending(formURL: "https://api.rythmico.com/test-url?foo=bar"))
        try XCTAssertJSONCoding(ProfileStatus.interviewPending)
        try XCTAssertJSONCoding(ProfileStatus.interviewFailed)
        try XCTAssertJSONCoding(ProfileStatus.verified)
    }
}
