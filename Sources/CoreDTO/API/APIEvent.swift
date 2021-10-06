import FoundationEncore

public protocol APIEventProtocol: Codable, Equatable, RawRepresentableWithUnknown where RawValue == String {
    static var unknown: Self { get }
}
