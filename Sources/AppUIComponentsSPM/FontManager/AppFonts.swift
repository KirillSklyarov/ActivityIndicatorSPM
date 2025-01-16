import UIKit

public struct AppFonts {
    private static let basicFont = UIFont.systemFont(ofSize: 30)

    public enum Style: String {
        case regular = "SFProRounded-Regular"
        case semibold = "SFProRounded-Semibold"
        case medium = "SFProRounded-Medium"
        case bold = "SFProRounded-Bold"

        func font(size: CGFloat) -> UIFont {
            return UIFont(name: self.rawValue, size: size) ?? AppFonts.basicFont
        }
    }

    // Regular fonts
    public static let regular: RegularFonts = RegularFonts()
    public static let semibold: SemiboldFonts = SemiboldFonts()
    public static let medium: MediumFonts = MediumFonts()
    public static let bold: BoldFonts = BoldFonts()

    public struct RegularFonts : Sendable {
        public let size12 = Style.regular.font(size: 12)
        public let size14 = Style.regular.font(size: 14)
        public let size16 = Style.regular.font(size: 16)
        public let size18 = Style.regular.font(size: 18)
        public let size20 = Style.regular.font(size: 20)
    }

    public struct SemiboldFonts : Sendable {
        public let size12 = Style.semibold.font(size: 12)
        public let size14 = Style.semibold.font(size: 14)
        public let size16 = Style.semibold.font(size: 16)
        public let size18 = Style.semibold.font(size: 18)
        public let size20 = Style.semibold.font(size: 20)
        public let size22 = Style.semibold.font(size: 22)
    }

    public struct MediumFonts : Sendable {
        public let size12 = Style.medium.font(size: 12)
        public let size14 = Style.medium.font(size: 14)
        public let size16 = Style.medium.font(size: 16)
    }

    public struct BoldFonts : Sendable {
        public let size14 = Style.bold.font(size: 14)
        public let size16 = Style.bold.font(size: 16)
        public let size18 = Style.bold.font(size: 18)
        public let size20 = Style.bold.font(size: 20)
        public let size22 = Style.bold.font(size: 22)
        public let size24 = Style.bold.font(size: 24)
        public let size26 = Style.bold.font(size: 26)
        public let size30 = Style.bold.font(size: 30)
        public let size34 = Style.bold.font(size: 34)
        public let size40 = Style.bold.font(size: 40)
    }
}
