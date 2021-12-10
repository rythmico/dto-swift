open class DTOTestCase: XCTestCase {
    open override class func setUp() {
        XCTAssertJSON.configuration = .init(
            encoder: JSONEncoder() => (\.dateEncodingStrategy, .iso8601),
            decoder: JSONDecoder() => (\.dateDecodingStrategy, .iso8601)
        )
    }
}
