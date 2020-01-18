//
//  StoryboardLoadable.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 19.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

enum StoryboardName: String {

    case main = "Main"
}

protocol StoryboardLoadable {

    static var storyboardName: StoryboardName { get }
}
