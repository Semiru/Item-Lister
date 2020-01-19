//
//  UIColor+Styling.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

// MARK: - Color Style Guide

extension UIColor {

    static var redColor: UIColor {
        return color(withRed: 252.0, green: 26.0, blue: 40.0)
    }

    static var grayColor: UIColor {
        return color(withRed: 190.0, green: 200.0, blue: 208.0)
    }

    static var whiteColor: UIColor {
        return color(withRed: 255.0, green: 255.0, blue: 255.0)
    }

    static var blackColor: UIColor {
        return color(withRed: 0.0, green: 0.0, blue: 0.0)
    }

    private static func color(withRed red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
}
