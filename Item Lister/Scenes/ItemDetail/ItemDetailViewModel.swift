//
//  ItemDetailViewModel.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 19.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import Foundation

final class ItemDetailViewModel {

    private(set) var item: Item
    private(set) var imageData: Data?

    init(item: Item, imageData: Data?) {
        self.item = item
        self.imageData = imageData
    }
}
