import TutorDTO
import XCTJSONKit

final class ProfileStatusTests: XCTestCase {
    func testCodable() throws {
        try XCTAssertJSONCoding(ProfileStatus.registrationPending(formURL: "https://api.rythmico.com/test-url?foo=bar"))
        try XCTAssertJSONCoding(ProfileStatus.interviewPending)
        try XCTAssertJSONCoding(ProfileStatus.interviewFailed)
        try XCTAssertJSONCoding(ProfileStatus.verified)
    }
}
