import UIKit

public final class AppBlurView: UIVisualEffectView {

    private let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)

    public override init(effect: UIVisualEffect?) {
        super.init(effect: effect ?? blurEffect)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
