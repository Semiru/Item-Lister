//
//  Instantiatable.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 19.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

protocol Instantiatable {

    static func instantiate() -> Self
}

extension Instantiatable where Self: StoryboardLoadable {

    /// Instantiates view controller whose identifier is its class name
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let identifier = String(describing: self)

        guard let viewController = storyboard.instantiateViewController(identifier: identifier) as? Self else {
            fatalError("Instantiation from storyboard failed!")
        }

        return viewController
    }
}
