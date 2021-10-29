import CoreDTO
import XCTJSONKit

final class InstrumentTests: XCTestCase {}

extension InstrumentTests {
    func testInit() throws {
        let sut = Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B")
        XCTAssertEqual(sut.id, .known(.guitar))
        XCTAssertEqual(sut.standaloneName, "A")
        XCTAssertEqual(sut.assimilatedName, "B")
    }

    func testInit_knownID() throws {
        let sut = Instrument(id: .guitar, standaloneName: "A", assimilatedName: "B")
        XCTAssertEqual(sut.id, .known(.guitar))
        XCTAssertEqual(sut.standaloneName, "A")
        XCTAssertEqual(sut.assimilatedName, "B")
    }
}

extension InstrumentTests {
    func testCodable() throws {
        let sut = Instrument(id: .known(.guitar), standaloneName: "A", assimilatedName: "B")
        try XCTAssertJSONCoding(sut)
    }
}
