//
//  UIFont+Styling.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

enum FontType {

    case standard
    case light
    case semibold
    case bold

    var name: String {
        switch self {
        case .standard:
            return "OpenSans"
        case .light:
            return "OpenSans-Light"
        case .semibold:
            return "OpenSans-Semibold"
        case .bold:
            return "OpenSans-Bold"
        }
    }
}

// MARK: - Font Style Guide

extension UIFont {

    static func font(withFontType fontType: FontType, size: CGFloat) -> UIFont? {
        return UIFont(name: fontType.name, size: size)
    }
}
