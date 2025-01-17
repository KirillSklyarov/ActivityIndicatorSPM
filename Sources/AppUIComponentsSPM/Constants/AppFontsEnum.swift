import UIKit

public enum AppFontsEnum {
    case regular(size: CGFloat)
    case bold(size: CGFloat)
    case semibold(size: CGFloat)
    case medium(size: CGFloat)

    var font: UIFont {
        switch self {
        case .regular(size: let size): return UIFont(name: "SFProRounded-Regular", size: size)!
        case .medium(size: let size): return UIFont(name: "SFProRounded-Medium", size: size)!
        case .semibold(size: let size): return UIFont(name: "SFProRounded-Semibold", size: size)!
        case .bold(size: let size): return UIFont(name: "SFProRounded-Bold", size: size)!
        }
    }
}
