@testable import TutorDTO
import XCTDTOKit

final class LessonPlanApplicationTests: DTOTestCase {
    lazy var sut = LessonPlanApplication(
        id: "APPLICATION_ID",
        createdAt: "2021-11-25T13:25:00Z",
        request: request,
        privateNote: "APPLICATION_PRIVATE_NOTE",
        retractedAt: nil
        // TODO: upcoming
    )

    lazy var request = LessonPlanRequest(
        id: "REQUEST_ID",
        submitterName: "SUBMITTER_NAME",
        instrument: Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B"),
        student: LessonPlanRequestPartialStudent(
            firstName: "FIRST_NAME",
            age: 24,
            about: "ABOUT"
        ),
        address: LessonPlanRequestPartialAddress(
            latitude: 123,
            longitude: 456,
            district: "DISTRICT",
            districtCode: "DISTRICT_CODE"
        ),
        schedule: LessonPlanRequestSchedule(
            start: "2021-07-21",
            time: "17:24",
            duration: .init(hours: 2, minutes: 10, seconds: 5)
        ),
        privateNote: "REQUEST_PRIVATE_NOTE"
    )

    func testCodable() throws {
        try XCTAssertJSONCoding(sut)
    }

    func testInitWithStatus() throws {
        func sut(withStatus status: LessonPlanApplication.Status) -> LessonPlanApplication {
            LessonPlanApplication(
                id: "APPLICATION_ID",
                createdAt: "2021-11-25T13:25:00Z",
                request: request,
                privateNote: "APPLICATION_PRIVATE_NOTE",
                status: status
            )
        }
        sut(withStatus: .pending) => {
            XCTAssertEqual($0.id, "APPLICATION_ID")
            XCTAssertEqual($0.createdAt, "2021-11-25T13:25:00Z")
            XCTAssertEqual($0.privateNote, "APPLICATION_PRIVATE_NOTE")
            XCTAssertEqual($0.status, .pending)
        }
        sut(withStatus: .retracted("2021-12-10T15:43:00Z")) => {
            XCTAssertEqual($0.id, "APPLICATION_ID")
            XCTAssertEqual($0.createdAt, "2021-11-25T13:25:00Z")
            XCTAssertEqual($0.privateNote, "APPLICATION_PRIVATE_NOTE")
            XCTAssertEqual($0.status, .retracted("2021-12-10T15:43:00Z"))
        }
        // TODO: upcoming
    }

    // TODO: upcoming
    func testGetStatus() throws {
        sut => {
//            $0.request.cancellationInfo = nil
            $0.retractedAt = nil
//            $0.notSelectedAt = nil
//            $0.plan = nil
        } => {
            XCTAssertEqual($0.status, .pending)

            $0.retractedAt = "2021-12-10T15:43:00Z"
            XCTAssertEqual($0.status, .retracted("2021-12-10T15:43:00Z"))
        }
    }

    // TODO: upcoming
    func testSetStatus() throws {
        sut => {
//            $0.request.cancellationInfo = [...]
            $0.retractedAt = "2021-12-10T15:43:00Z"
//            $0.notSelectedAt = [...]
//            $0.plan = [...]
        } => {
            $0 => {
                $0.status = .pending
                XCTAssertEqual($0.status, .pending)
            }
            $0 => {
                $0.status = .retracted("2021-12-10T15:43:00Z")
                XCTAssertEqual($0.status, .retracted("2021-12-10T15:43:00Z"))
            }
        }
    }
}
