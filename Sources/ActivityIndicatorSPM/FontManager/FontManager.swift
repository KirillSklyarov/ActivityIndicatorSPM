import UIKit
import CoreGraphics
import CoreText

public enum FontManager {

    public enum FontName: String, CaseIterable {
        case black = "SF-Pro-Rounded-Black"
        case bold = "SF-Pro-Rounded-Bold"
        case heavy = "SF-Pro-Rounded-Heavy"
        case light = "SF-Pro-Rounded-Light"
        case medium = "SF-Pro-Rounded-Medium"
        case regular = "SF-Pro-Rounded-Regular"
        case semibold = "SF-Pro-Rounded-Semibold"
        case thin = "SF-Pro-Rounded-Thin"
        case ultraLight = "SF-Pro-Rounded-Ultralight"

        var filename: String {
            return self.rawValue
        }

        var fontName: String {
            // Системное имя шрифта отличается от имени файла
            return self.rawValue.replacingOccurrences(of: "-", with: "")
        }
    }

    public static func setupFonts() {
        FontName.allCases.forEach { font in
            registerFont(name: font.filename)

            if UIFont(name: font.rawValue, size: 12) != nil {
                print("✅ Font successfully registered: \(font.rawValue)")
            } else {
                print("❌ Failed to register font: \(font.rawValue)")
            }
        }
    }

    private static func isFontRegistered(_ postScriptName: String) -> Bool {
        UIFont(name: postScriptName, size: 12) != nil
    }

    private static func registerFont(name: String) {
        let bundle = Bundle.module

        guard let fontURL = bundle.url(forResource: name, withExtension: "otf") else {
            print("Failed to find font in bundle")
            return
        }

        guard let fontData = try? Data(contentsOf: fontURL) else {
            print("Failed to load font data")
            return
        }

        guard let provider = CGDataProvider(data: fontData as CFData),
              let font = CGFont(provider) else {
            print("Failed to create font")
            return
        }

        var error: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &error) {
            print("✅ Successfully registered font: \(name)")
        } else {
            if let error = error?.takeRetainedValue() {
                let description = CFErrorCopyDescription(error)
                print("❌ Error registering font: \(description)")
            }
        }
    }

    public static func printAvailableFonts() {
            FontName.allCases.forEach { font in
                if isFontRegistered(font.fontName) {
                    print("✅ Available: \(font.fontName)")
                } else {
                    print("❌ Not available: \(font.fontName)")
                }
            }
        }
}
