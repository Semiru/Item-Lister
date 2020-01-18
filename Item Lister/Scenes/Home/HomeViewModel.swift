//
//  HomeViewModel.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import Foundation

// MARK: - HomeStateChange

enum HomeStateChange: StateChange {

    case loadingStateChanged(isLoading: Bool)
    case fetchItemListSuccess
    case fetchItemListFailure
}

// MARK: - HomeViewModel

final class HomeViewModel: StatefulViewModel<HomeStateChange> {

    // MARK: - Properties

    var selectedItemIndex: Int?
    private(set) var itemList: [Item] = []
}

// MARK: - Network

extension HomeViewModel {

    func fetchItemList() {
        emit(change: .loadingStateChanged(isLoading: true))

        NetworkManager.shared.fetchItemList { [weak self] itemList in
            guard let strongSelf = self else {
                return
            }

            strongSelf.emit(change: .loadingStateChanged(isLoading: false))

            guard let itemList = itemList else {
                strongSelf.emit(change: .fetchItemListFailure)
                return
            }

            strongSelf.itemList = itemList
            strongSelf.emit(change: .fetchItemListSuccess)
        }
    }
}

// MARK: - View Model Creation

extension HomeViewModel {

    func createItemDetailViewModel() -> ItemDetailViewModel? {
        guard let index = selectedItemIndex else {
            return nil
        }

        return ItemDetailViewModel(item: itemList[index])
    }
}
