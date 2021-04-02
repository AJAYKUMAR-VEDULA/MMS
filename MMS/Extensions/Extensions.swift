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
    
    func circle() {
        self.layer.cornerRadius = self.frame.size.width/2
    }
    
    func shadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}

extension UIImageView {
    func setImage(named: String) {
        self.image = UIImage(named: named)
    }
}

extension UICollectionView {
    func registerNibs(nibName: String, cellReuseIdentifier: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}

extension UITableView {
    func registerNibs(nibName: String, cellReuseIdentifier: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }
}

extension UIColor {
    class var lowGrey : UIColor {
        return UIColor.rgb(r: 239, g: 239, b: 239)
    }
    class var peachGrey : UIColor {
        return UIColor.rgb(r: 94, g: 138, b: 169)
    }
    class var greenGrey : UIColor {
        return UIColor.rgb(r: 1, g: 139, b: 138)
    }
    class var babyPink : UIColor {
        return UIColor.rgb(r: 206, g: 112, b: 174)
    }
    class var peachGreen : UIColor {
        return UIColor.rgb(r: 164, g: 193, b: 171)
    }
    class var darkOrange : UIColor {
        return UIColor.rgb(r: 202, g: 67, b: 10)
    }
    class var darkGreen : UIColor {
        return UIColor.rgb(r: 126, g: 128, b: 1)
    }
    class var pale : UIColor {
        return UIColor.rgb(r: 115, g: 135, b: 119)
    }
    class var darkPink : UIColor {
        return UIColor.rgb(r: 141, g: 69, b: 132)
    }
    class var darkNavyBlue : UIColor {
        return UIColor.rgb(r: 24, g: 86, b: 138)
    }
    class var darkBlackBlue : UIColor {
        return UIColor.rgb(r: 14, g: 53, b: 86)
    }
    class var paleRed : UIColor {
        return UIColor.rgb(r: 175, g: 17, b: 21)
    }
    class var shadowGrey : UIColor {
        return UIColor.rgb(r: 196, g: 196, b: 196)
    }
    
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    
    class func getColorByCode(code: Int) -> UIColor {
        switch code {
        case 0:
            return lowGrey
        case 1:
            return peachGrey
        case 2:
            return greenGrey
        case 3:
            return babyPink
        case 4:
            return peachGreen
        case 5:
            return darkOrange
        case 6:
            return darkGreen
        case 7:
            return pale
        case 8:
            return darkPink
        case 9:
            return darkNavyBlue
        default:
            return blue
        
        }
    }
}
