import UIKit

public final class AppActivityIndicator: UIActivityIndicatorView {

    public override init(style: UIActivityIndicatorView.Style = .large) {
        super.init(style: style)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppActivityIndicator {
    func setupUI() {
        let buttonOrange = UIColor(red: 1.0, green: 0.392, blue: 0, alpha: 1.0)
        color = buttonOrange
    }
}
