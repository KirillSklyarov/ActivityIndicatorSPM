import UIKit

public enum CartButtonViewType {
    case itemDetail
    case cart
}

public final class AppCartButtonView: UIView {

    public var cartButton: AppButtons?
    public var isCart: Bool = false
    public var currentPrice = 0

    public var onCartButtonTapped: (() -> Void)?

    public init(type: CartButtonViewType) {
        super.init(frame: .zero)
        configure(type)
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppCartButtonView {
    func configure(_ type: CartButtonViewType) {
        let blurView = AppBlurView()

        switch type {
        case .itemDetail: isCart = false
        case .cart: isCart = true
        }

        cartButton = AppButtons(type: .cartOrange)
        guard let cartButton else { return }
        addSubviews(blurView, cartButton)

        setupLayout(blurView, cartButton)
    }

    func setupLayout(_ blurView: AppBlurView, _ cartButton: AppButtons) {
        heightAnchor.constraint(equalToConstant: 90).isActive = true
        blurView.setConstraints()
        cartButton.setLocalConstraints(top: 10, left: 20, right: 20)
    }

    func setupActions() {
        cartButton?.onButtonTapped = { [weak self] in
            guard let self else { print("Self is nil"); return }
            onCartButtonTapped?()
        }
    }
}
