import UIKit

public extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Couldn't create font from data")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

public extension UIFont {
    static let setupDefaultFonts: Void = {
        let bundle = Bundle.module
        // Регистрируем каждый шрифт
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Black", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Bold", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Heavy", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Light", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Medium", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Regular", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Semibold", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Thin", fontExtension: "ttf")
        registerFont(bundle: bundle, fontName: "SF-Pro-Rounded-Ultralight", fontExtension: "ttf")
    }()
}
