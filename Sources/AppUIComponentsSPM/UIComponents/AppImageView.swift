import UIKit

public enum AppImageViewType {
    case payment
    case dodoCoins
    case dodoCoinsLarge
    case courier
    case chevronDown
    case hit
    case justView
    case smallView
    case mediumView
    case largeView
    case stories
    case toppings
    case chosenTopping
    case promoImage
    case mapPin
    case addressPoint
    case radiusCornerView
    case checkmark
    case errorXMark
}

public final class AppImageView: UIImageView {

    public init(type: AppImageViewType, image: UIImage? = nil, backgroundColor: UIColor? = nil) {
        super.init(frame: .zero)
        configure(type, image: image, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppImageView {
    func configure(_ type: AppImageViewType, image: UIImage? = nil, backgroundColor: UIColor? = nil) {
        switch type {
        case .payment:
            self.image = image
            widthAnchor.constraint(equalToConstant: 24).isActive = true
            contentMode = .scaleAspectFit
        case .dodoCoins:
            self.image = UIImage(named: "dodoCoinsImage")
            contentMode = .scaleAspectFit
        case .courier:
            self.image = UIImage(systemName: "figure.hiking")?.withTintColor(AppColors.buttonOrange, renderingMode: .alwaysOriginal)
            contentMode = .scaleAspectFit
            self.backgroundColor = backgroundColor
            isOpaque = true
        case .chevronDown:
//            self.image = UIImage(systemName: "chevron.down")?.withTintColor(.white, renderingMode: .alwaysOriginal)
//            contentMode = .scaleAspectFit

            let config = UIImage.SymbolConfiguration(scale: .medium)
            self.image = UIImage(systemName: "chevron.down", withConfiguration: config)?
                .withTintColor(.white, renderingMode: .alwaysOriginal)
                .withBaselineOffset(fromBottom: 0)
            self.contentMode = .scaleAspectFit
            self.isOpaque = true // Добавляем это
            self.backgroundColor = backgroundColor // И это

        case .hit:
            self.image = UIImage(named: "hit2")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 30).isActive = true
            widthAnchor.constraint(equalToConstant: 30).isActive = true
        case .largeView:
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 150).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
        case .justView:
            contentMode = .scaleAspectFit
            self.backgroundColor = backgroundColor
            isOpaque = true
        case .stories:
            contentMode = .scaleAspectFill
            layer.cornerRadius = 20
            layer.masksToBounds = true
        case .toppings:
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 60).isActive = true
            widthAnchor.constraint(equalToConstant: 60).isActive = true
        case .chosenTopping:
            self.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(AppColors.buttonOrange, renderingMode: .alwaysOriginal)
            contentMode = .scaleAspectFit
            isHidden = true
        case .dodoCoinsLarge:
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 70).isActive = true
            widthAnchor.constraint(equalToConstant: 70).isActive = true
        case .promoImage:
            contentMode = .scaleAspectFit
//            layer.masksToBounds = true
        case .mapPin:
            self.image = UIImage(systemName:  "mappin")?.withTintColor(AppColors.buttonOrange, renderingMode: .alwaysOriginal)
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 40).isActive = true
            widthAnchor.constraint(equalToConstant: 40).isActive = true
        case .addressPoint:
            self.image = UIImage(systemName: "record.circle.fill")?.withTintColor(AppColors.buttonOrange, renderingMode: .alwaysOriginal)
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 25).isActive = true
            widthAnchor.constraint(equalToConstant: 25).isActive = true
        case .mediumView:
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 100).isActive = true
            widthAnchor.constraint(equalToConstant: 100).isActive = true
        case .radiusCornerView:
            layer.cornerRadius = 14
            layer.masksToBounds = true
        case .smallView:
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 25).isActive = true
            widthAnchor.constraint(equalToConstant: 25).isActive = true
        case .checkmark:
            self.image = UIImage(systemName: "checkmark.circle")?.withTintColor(AppColors.buttonOrange, renderingMode: .alwaysOriginal)
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 100).isActive = true
            widthAnchor.constraint(equalToConstant: 100).isActive = true
        case .errorXMark:
            self.image = UIImage(systemName: "xmark.circle")?.withTintColor(AppColors.buttonOrange, renderingMode: .alwaysOriginal)
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 70).isActive = true
            widthAnchor.constraint(equalToConstant: 70).isActive = true
        }
    }
}
