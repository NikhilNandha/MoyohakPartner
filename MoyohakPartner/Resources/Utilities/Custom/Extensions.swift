//
//  Extensions.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let ThemeColorPrimary = UIColor.init(red: 0.0/255.0, green: 127.0/255.0, blue: 194.0/255.0, alpha: 1.0)
    static let ThemeColorGreen = UIColor.init(red: 177.0/255.0, green: 205.0/255.0, blue: 47.0/255.0, alpha: 1.0)
    static let ThemeButtonBG = UIColor.init(red: 46.0/255.0, green: 46.0/255.0, blue: 46.0/255.0, alpha: 1.0)
    static let ThemeLightGrey = UIColor.init(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0)
    static let ThemeTextDarkGrey = UIColor.init(red: 94.0/255.0, green: 94.0/255.0, blue: 94.0/255.0, alpha: 1.0)
    
}

extension UIFont {
    
    static func MuliRegular(_ size: Int) -> UIFont {
        return UIFont.init(name: "MULI-REGULAR", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static func MuliSemiBold(_ size: Int) -> UIFont {
        return UIFont.init(name: "MULI-SEMIBOLD", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static func MuliBold(_ size: Int) -> UIFont {
        return UIFont.init(name: "MULI-BOLD", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static func MuliExtraBold(_ size: Int) -> UIFont {
        return UIFont.init(name: "MULI-EXTRABOLD", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
}

extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 3, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
