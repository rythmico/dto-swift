import Foundation

public struct AddressLookupItem: AddressProtocol, Codable, Hashable {
    public var latitude: Double
    public var longitude: Double
    public var line1: String
    public var line2: String
    public var line3: String
    public var line4: String
    public var district: String
    public var city: String
    public var state: String
    public var postcode: String
    public var country: String

    public init(
        latitude: Double,
        longitude: Double,
        line1: String,
        line2: String,
        line3: String,
        line4: String,
        district: String,
        city: String,
        state: String,
        postcode: String,
        country: String
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.line1 = line1
        self.line2 = line2
        self.line3 = line3
        self.line4 = line4
        self.district = district
        self.city = city
        self.state = state
        self.postcode = postcode
        self.country = country
    }
}
