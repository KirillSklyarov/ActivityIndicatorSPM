import UIKit

public class AppSwitch: UISwitch {

    public init(isHidden: Bool = true) {
        super.init(frame: .zero)
        isOn = false
        self.isHidden = isHidden
        backgroundColor = AppColors.backgroundGray
        isOpaque = true
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

