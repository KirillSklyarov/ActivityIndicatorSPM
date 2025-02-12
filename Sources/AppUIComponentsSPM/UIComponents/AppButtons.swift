import UIKit

public enum AppButtonType {
    case decrementCount
    case incrementCount
    case grayPrice
    case orangeDismiss
    case orangeApplyPromo
    case mapEdit
    case grayXmark
    case profileChat
    case personal
    case errorRetry
    case infoButton
    case addNewAddress
    case actionSheetButton
    case promoButton
    case scrollUp
    case textFieldClear
    case cartOrange
    case cartGray
    case cartMain
}

public final class AppButtons: UIButton {

    public var onButtonTapped: (() -> Void)?

    public init(type: AppButtonType, text: String? = nil) {
        super.init(frame: .zero)
        configureLabel(type: type, text: text)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppButtons {
    func configureLabel(type: AppButtonType, text: String?) {
        switch type {
        case .decrementCount:
            let image = UIImage(systemName: "minus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)
        case .incrementCount:
            let image = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)
        case .grayPrice:
            titleLabel?.font = AppFonts.semibold(size: 14).font
            setTitleColor(.white, for: .normal)
            backgroundColor = AppColors.buttonGray
            layer.cornerRadius = 14
            clipsToBounds = true
            setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
            widthAnchor.constraint(equalToConstant: 90).isActive = true
        case .orangeDismiss:
            setTitle("Закрыть", for: .normal)
            setTitleColor(AppColors.buttonOrange, for: .normal)
        case .mapEdit:
            let image = UIImage(systemName: "pencil")?.withTintColor(AppColors.buttonGray, renderingMode: .alwaysOriginal)
            contentHorizontalAlignment = .fill
            contentVerticalAlignment = .fill
            setImage(image, for: .normal)
            frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        case .orangeApplyPromo:
            let title = "Применить"
            var config = UIButton.Configuration.filled()
            config.title = title
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: AppFonts.bold(size: 14).font])
            )
            config.baseForegroundColor = .white
            config.baseBackgroundColor = AppColors.buttonOrange
            config.cornerStyle = .capsule
            configuration = config
        case .grayXmark:
            let image = UIImage(systemName: "xmark")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)
            isOpaque = true
        case .profileChat:
            let image = UIImage(systemName: "phone.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)
            backgroundColor = AppColors.backgroundGray
            heightAnchor.constraint(equalToConstant: 40).isActive = true
            widthAnchor.constraint(equalToConstant: 40).isActive = true
            layer.cornerRadius = 40 / 2
            layer.masksToBounds = true
            isOpaque = true
        case .personal:
            let image = UIImage(systemName: "hexagon.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)
            backgroundColor = AppColors.backgroundGray
            heightAnchor.constraint(equalToConstant: 40).isActive = true
            widthAnchor.constraint(equalToConstant: 40).isActive = true
            layer.cornerRadius = 40 / 2
            layer.masksToBounds = true
            isOpaque = true
        case .errorRetry:
            var config = UIButton.Configuration.filled()
            config.attributedTitle = AttributedString("Повторить", attributes: AttributeContainer([
                .font: AppFonts.bold(size: 16).font,
                .foregroundColor: AppColors.grayFont])
            )
            config.baseBackgroundColor = AppColors.buttonGray
            config.cornerStyle = .capsule
            configuration = config
        case .infoButton:
            let image = UIImage(systemName: "info.circle")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)
            heightAnchor.constraint(equalToConstant: 24).isActive = true
            widthAnchor.constraint(equalToConstant: 24).isActive = true
            contentVerticalAlignment = .fill
            contentHorizontalAlignment = .fill
        case .addNewAddress:
            let title = "+ Новый адрес"
            var config = UIButton.Configuration.filled()
            config.title = title
            config.attributedTitle = AttributedString(title, attributes:
                                                        AttributeContainer([ .font: AppFonts.bold(size: 14).font]))
            config.baseForegroundColor = .white
            config.baseBackgroundColor = AppColors.buttonGray
            config.cornerStyle = .capsule
            configuration = config
            widthAnchor.constraint(equalToConstant: 150).isActive = true
        case .actionSheetButton:
            let attributedTitle = NSAttributedString(string: text ?? "", attributes: [.foregroundColor: AppColors.buttonOrange, .font: AppFonts.semibold(size: 22).font])
            setAttributedTitle(attributedTitle, for: .normal)
            backgroundColor = AppColors.backgroundGray
            isOpaque = true
        case .promoButton:
            setTitle("Ввести промокод", for: .normal)
            setTitleColor(.white, for: .normal)
            titleLabel?.font = AppFonts.bold(size: 20).font
            backgroundColor = AppColors.backgroundGray
            layer.cornerRadius = 10
            layer.cornerRadius = 20
            layer.masksToBounds = true
            heightAnchor.constraint(equalToConstant: 50).isActive = true
        case .scrollUp:
            let image = UIImage(systemName: "chevron.up")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            backgroundColor = AppColors.buttonGray
            setImage(image, for: .normal)
            layer.cornerRadius = 20
            layer.masksToBounds = true
            isHidden = true
            widthAnchor.constraint(equalToConstant: 40).isActive = true
            heightAnchor.constraint(equalToConstant: 40).isActive = true
        case .textFieldClear:
            let image = UIImage(systemName: "xmark.circle.fill")
            setImage(image, for: .normal)
            tintColor = AppColors.grayFont
            isHidden = true
        case .cartOrange:
            //            let image = UIImage(systemName: "cart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            let title = text ?? ""

            var config = UIButton.Configuration.plain()
            config.imagePadding = 10
            config.title = title
            config.image = nil
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .foregroundColor: UIColor.white,
                .font: AppFonts.bold(size: 18).font]
            ))
            config.cornerStyle = .capsule
            config.background.backgroundColor = AppColors.buttonOrange
            configuration = config
            self.isHidden = false
            heightAnchor.constraint(equalToConstant: 50).isActive = true
        case .cartGray:
            let title = text ?? ""
            var config = UIButton.Configuration.plain()
            config.imagePadding = 10
            config.title = title
            config.image = nil
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .foregroundColor: UIColor.white,
                .font: AppFonts.bold(size: 18).font]
            ))
            config.cornerStyle = .capsule
            config.background.backgroundColor = AppColors.buttonGray
            configuration = config
            self.isHidden = false
            heightAnchor.constraint(equalToConstant: 50).isActive = true
        case .cartMain:
            let image = UIImage(systemName: "cart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            let title = text ?? ""

            var config = UIButton.Configuration.plain()
            config.imagePadding = 10
            config.title = title
            config.image = image
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .foregroundColor: UIColor.white,
                .font: AppFonts.bold(size: 18).font]
            ))
            config.cornerStyle = .capsule
            config.background.backgroundColor = AppColors.buttonOrange
            configuration = config
            self.isHidden = true
            heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        onButtonTapped?()
    }
}
