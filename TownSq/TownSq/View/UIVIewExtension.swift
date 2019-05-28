import UIKit

extension UIView {

    func addShadowToView () {
        clipsToBounds = false
        layer.shadowOpacity = 0.25
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }

}
