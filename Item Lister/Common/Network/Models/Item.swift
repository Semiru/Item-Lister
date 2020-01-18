//
//  Item.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

struct Item: Decodable {

    let id: String
    let category: String
    let name: String
    let price: String
    let image: String
}
