import UIKit

public class InsetLabel: UILabel {

    var contentInset: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInset))
    }

    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += contentInset.top + contentInset.bottom
        size.width += contentInset.left + contentInset.right
        return size
    }
}
