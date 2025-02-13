import UIKit

public enum RoundButtonType {
    case standard
    case chevron
    case storiesWhite
    case chat
    case personal
}

public final class AppRoundButtonView: UIView {

    // MARK: - UI Properties
    private lazy var dismissButton = AppButtons(type: .grayXmark)

    // MARK: - Properties&Callbacks
    private let viewSize: CGFloat = 40
    public var onButtonTapped: (() -> Void)?

    public init(type: RoundButtonType) {
        super.init(frame: .zero)
        configure(type)
        setupUI()
        setupAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
private extension AppRoundButtonView {
    func configure(_ type: RoundButtonType) {
        switch type {
        case .standard:
            setColors(xColor: .white, backgroundColor: AppColors.backgroundGray)
        case .chevron: setChevron()
        case .storiesWhite:
            setColors(xColor: AppColors.buttonGray, backgroundColor: .white)
        case .chat:
            dismissButton = AppButtons(type: .profileChat)
            setColors(xColor: .white, backgroundColor: AppColors.backgroundGray)
        case .personal:
            dismissButton = AppButtons(type: .personal)
            setColors(xColor: .white, backgroundColor: AppColors.backgroundGray)
        }
    }
}

// MARK: - Setup UI
private extension AppRoundButtonView {
    func setupUI() {
        heightAnchor.constraint(equalToConstant: viewSize).isActive = true
        widthAnchor.constraint(equalToConstant: viewSize).isActive = true

        layer.cornerRadius = viewSize / 2
        layer.masksToBounds = true
        isOpaque = true

        addSubviews(dismissButton)
        
        setupLayout()
    }

    func setupLayout() {
        dismissButton.setConstraints()
    }
}

// MARK: - Setup actions
private extension AppRoundButtonView {
    func setupAction() {
        setupDismissButtonAction()
    }

    func setupDismissButtonAction() {
        dismissButton.onButtonTapped = { [weak self] in
            self?.onButtonTapped?()
        }
    }
}

// MARK: - Supporting methods
private extension AppRoundButtonView {
    func setColors(xColor: UIColor, backgroundColor: UIColor) {
        dismissButton.backgroundColor = backgroundColor
        dismissButton.layer.masksToBounds = true
        dismissButton.layer.allowsGroupOpacity = true
    }

    func setChevron() {
        let image = UIImage(systemName: "chevron.left")?.withTintColor(AppColors.grayFont, renderingMode: .alwaysOriginal)
        dismissButton.setImage(image, for: .normal)
    }
}
