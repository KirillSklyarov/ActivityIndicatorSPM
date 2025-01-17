import UIKit

private let basicFont = UIFont.systemFont(ofSize: 30)

public enum AppFonts {
    case regular(size: CGFloat)
    case bold(size: CGFloat)
    case semibold(size: CGFloat)
    case medium(size: CGFloat)

    public var font: UIFont {
        switch self {
        case .regular(size: let size): return UIFont(name: "SFProRounded-Regular", size: size) ?? basicFont
        case .medium(size: let size): return UIFont(name: "SFProRounded-Medium", size: size) ?? basicFont
        case .semibold(size: let size): return UIFont(name: "SFProRounded-Semibold", size: size) ?? basicFont
        case .bold(size: let size): return UIFont(name: "SFProRounded-Bold", size: size) ?? basicFont
        }
    }
}
