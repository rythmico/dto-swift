import FoundationEncore

public enum ProfileStatus: Equatable {
    case registrationPending(formURL: URL)
    case interviewPending
    case interviewFailed
    case verified
}

extension ProfileStatus: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let status = try container.decode(CaseLabel.self, forKey: .status)
        switch status {
        case .registrationPending:
            let formURL = try container.decode(URL.self, forKey: .formURL)
            self = .registrationPending(formURL: formURL)
        case .interviewPending:
            self = .interviewPending
        case .interviewFailed:
            self = .interviewFailed
        case .verified:
            self = .verified
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .registrationPending(let formURL):
            try container.encode(CaseLabel.registrationPending, forKey: .status)
            try container.encode(formURL, forKey: .formURL)
        case .interviewPending:
            try container.encode(CaseLabel.interviewPending, forKey: .status)
        case .interviewFailed:
            try container.encode(CaseLabel.interviewFailed, forKey: .status)
        case .verified:
            try container.encode(CaseLabel.verified, forKey: .status)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case status
        case formURL
    }

    private enum CaseLabel: String, Codable {
        case registrationPending = "REGISTRATION_PENDING"
        case interviewPending = "INTERVIEW_PENDING"
        case interviewFailed = "INTERVIEW_FAILED"
        case verified = "VERIFIED"
    }
}
