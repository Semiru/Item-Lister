//
//  UIButton+Styling.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

private enum Constants {

    static let cornerRadius: CGFloat = 16.0
}

// MARK: - Button Style Guide

extension UIButton {

    enum ButtonStyle {

        case redWhite(isRoundedCorner: Bool)
        case blackWhite(isRoundedCorner: Bool)
    }

    func applyStyle(for style: ButtonStyle) {
        switch style {
        case .redWhite(let isRoundedCorner):
            backgroundColor = .redColor
            setTitleColor(.whiteColor, for: .normal)

            if isRoundedCorner {
                layer.cornerRadius = Constants.cornerRadius
                clipsToBounds = true
            }
        case .blackWhite(let isRoundedCorner):
            backgroundColor = .blackColor
            setTitleColor(.whiteColor, for: .normal)

            if isRoundedCorner {
                layer.cornerRadius = Constants.cornerRadius
                clipsToBounds = true
            }
        }
    }
}
