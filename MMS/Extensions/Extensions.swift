//
//  Extensions.swift
//  MMS
//
//  Created by AJ on 28/02/21.
//

import Foundation
import UIKit

extension UITextField {
    func setAttributedPlaceHolder(string: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}

extension UIView {
    func roundedBorder(borderColor: CGColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = self.bounds.size.height * 0.5
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}

extension UIImageView {
    func setImage(named: String) {
        self.image = UIImage(named: named)
    }
}
