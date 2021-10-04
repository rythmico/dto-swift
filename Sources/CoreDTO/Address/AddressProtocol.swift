import Foundation

public protocol AddressProtocol {
    var latitude: Double { get }
    var longitude: Double { get }
    var line1: String { get }
    var line2: String { get }
    var line3: String { get }
    var line4: String { get }
    var city: String { get }
    var postcode: String { get }
    var country: String { get }
}
