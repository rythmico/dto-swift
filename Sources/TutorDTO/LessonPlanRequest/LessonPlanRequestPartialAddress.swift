import FoundationEncore

extension LessonPlanRequest {
    public typealias PartialAddress = LessonPlanRequestPartialAddress
}

public struct LessonPlanRequestPartialAddress: Codable, Hashable {
    public var latitude: Double
    public var longitude: Double
    public var district: String
    public var districtCode: String

    public init(
        latitude: Double,
        longitude: Double,
        district: String,
        districtCode: String
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.district = district
        self.districtCode = districtCode
    }
}
