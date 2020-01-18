//
//  StatefulViewModel.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

protocol StateChange { }

class StatefulViewModel<SC: StateChange> {

    typealias StateChangeHandler = ((SC) -> Void)

    private var stateChangeHandlers: [StateChangeHandler] = []

    final func addChangeHandler(_ handler: @escaping StateChangeHandler) {
        stateChangeHandlers.append(handler)
    }

    final func emit(change: SC) {
        stateChangeHandlers.forEach {
            $0(change)
        }
    }
}
