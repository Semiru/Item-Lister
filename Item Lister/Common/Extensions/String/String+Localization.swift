//
//  String+Localization.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import Foundation

extension String {

    /// Localized String object for a given String object instance(given instance is treated as key)
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
