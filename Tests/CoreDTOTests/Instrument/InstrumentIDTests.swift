import CoreDTO
import XCTJSONKit

final class InstrumentIDTests: XCTestCase {}

extension InstrumentIDTests {
    func testCodable() throws {
        // Known IDs
        for knownID in Instrument.KnownID.allCases {
            try XCTAssertJSONCoding(Instrument.ID.known(knownID))
        }
        // Unknown IDs
        try XCTAssertJSONCoding(Instrument.ID.unknown("lorem ipsum"))
    }

    func testDecodable() throws {
        // Known IDs
        for knownID in Instrument.KnownID.allCases {
            try XCTAssertJSONDecoding(.string(knownID.rawValue), Instrument.ID.known(knownID))
        }
        // Unknown IDs
        try XCTAssertJSONDecoding("lorem ipsum", Instrument.ID.unknown("lorem ipsum"))
    }

    func testEncodable() throws {
        // Known IDs
        for knownID in Instrument.KnownID.allCases {
            try XCTAssertJSONEncoding(Instrument.ID.known(knownID), .string(knownID.rawValue))
        }
        // Unknown IDs
        try XCTAssertJSONEncoding(Instrument.ID.unknown("lorem ipsum"), "lorem ipsum")
    }

    func testEquatable() {
        let sut = Instrument.ID.known(.guitar)
        XCTAssertEqual(sut, .known(.guitar))
        XCTAssertEqual(sut, .unknown("GUITAR"))
        XCTAssertNotEqual(sut, .known(.drums))
        XCTAssertNotEqual(sut, .unknown("guitar"))
    }

    func testHashable() {
        let sut = Instrument.ID.known(.guitar)
        XCTAssertEqual(sut.hashValue, Instrument.ID.known(.guitar).hashValue)
        XCTAssertEqual(sut.hashValue, Instrument.ID.unknown("GUITAR").hashValue)
        XCTAssertNotEqual(sut.hashValue, Instrument.ID.known(.drums).hashValue)
        XCTAssertNotEqual(sut.hashValue, Instrument.ID.unknown("guitar").hashValue)
    }
}

