//
//  HomeRouter.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

enum HomeRoute {

    case itemDetail
}

protocol HomeRouter {

    func route(to destination: HomeRoute, from context: HomeViewController)
}

final class DefaultHomeRouter: HomeRouter {

    func route(to destination: HomeRoute, from context: HomeViewController) {
        switch destination {
        case .itemDetail:
            // TODO: To be implemented.
            break
        }
    }
}
