import UIKit

public enum LabelType {
    case priceGrayRoundLabel
    case tinyTitle
    case smallTitle
    case basicTitle
    case maxiTitle
    case smallHeader
    case header
    case maxiHeader
}

public final class AppLabel: InsetLabel {

    public init(type: LabelType, text: String? = nil, textColor: UIColor? = .white, alignment: NSTextAlignment = .left, numberOfLines: Int = 0, backgroundColor: UIColor? = AppColors.backgroundGray) {
        super.init(frame: .zero)
        configureLabel(type: type, text: text, textColor: textColor, alignment: alignment, numberOfLines: numberOfLines, backgroundColor: backgroundColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppLabel {
    func configureLabel(type: LabelType, text: String?, textColor: UIColor?, alignment: NSTextAlignment, numberOfLines: Int, backgroundColor: UIColor?) {
        switch type {
        case .priceGrayRoundLabel:
            self.text = text
            self.textColor = textColor
            font = AppFonts.bold(size: 12).font
            textAlignment = .center
            self.numberOfLines = 1
            self.backgroundColor = .white.withAlphaComponent(0.2)
            layer.cornerRadius = 14
            clipsToBounds = true
            contentInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        case .tinyTitle:
            self.text = text
            self.textColor = textColor
            font = AppFonts.regular(size: 12).font
            textAlignment = alignment
        case .smallTitle:
            self.text = text
            self.textColor = textColor
            font = AppFonts.regular(size: 14).font
            textAlignment = alignment
            self.numberOfLines = numberOfLines
            self.backgroundColor = backgroundColor
            isOpaque = true
        case .basicTitle:
            self.text = text
            self.textColor = textColor
            font = AppFonts.semibold(size: 16).font
            textAlignment = alignment
            self.numberOfLines = numberOfLines
            self.backgroundColor = backgroundColor
            isOpaque = true
        case .maxiTitle:
            self.text = text
            self.textColor = textColor
            font = AppFonts.semibold(size: 18).font
            textAlignment = alignment
            self.numberOfLines = 0
            self.backgroundColor = backgroundColor
            isOpaque = true
        case .smallHeader:
            self.text = text
            self.textColor = textColor
            font = AppFonts.bold(size: 22).font
            textAlignment = alignment
            self.numberOfLines = numberOfLines
            self.backgroundColor = backgroundColor
            isOpaque = true
        case .header:
            self.text = text
            self.textColor = textColor
            font = AppFonts.bold(size: 26).font
            textAlignment = alignment
            self.numberOfLines = 1
        case .maxiHeader:
            self.text = text
            self.textColor = textColor
            font = AppFonts.bold(size: 40).font
            textAlignment = alignment
            self.numberOfLines = 1
        }
    }
}
