import UIKit

public enum AppNavigationBarViewType {
    case personal
    case delivery
    case chooseAddress
    case payment
    case cart
}

public final class AppNavigationBarView: UIView {

    // MARK: - Properties
    private var headerView: AppNavigationHeaderView?
    public var onDismissButtonTapped: (() -> Void)?

    // MARK: - Init
    public init(type: AppNavigationBarViewType) {
        super.init(frame: .zero)
        configure(type)
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppNavigationBarView {
    func configure(_ type: AppNavigationBarViewType) {
        let view: AppNavigationHeaderView =
        switch type {
        case .personal: AppNavigationHeaderView(title: "Личные данные")
        case .delivery: AppNavigationHeaderView(title: "Доставка")
        case .chooseAddress: AppNavigationHeaderView(title: "Адреса доставки")
        case .payment: AppNavigationHeaderView(title: "Оплата")
        case .cart: AppNavigationHeaderView(title: "Корзина")
        }

        headerView = view

        setupUI()
    }

    func setupUI() {
        guard let headerView else { return }
        addSubviews(headerView)
        setupLayout(headerView)
    }

    func setupAction() {
        headerView?.onDismissButtonTapped = { [weak self] in
            self?.onDismissButtonTapped?()
        }
    }
}

// MARK: - Supporting methods
private extension AppNavigationBarView {
    func setupLayout(_ view: AppNavigationHeaderView?) {
        guard let view else { return }
        view.setConstraints()
    }
}
