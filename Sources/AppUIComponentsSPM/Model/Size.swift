
public enum Size: Int, Codable {
    case small = 0
    case medium
    case large
    case oneSize

    var displayName: String {
        switch self {
        case .small: return "25 см"
        case .medium: return "30 см"
        case .large: return "35 см"
        case .oneSize: return ""
        }
    }
}
