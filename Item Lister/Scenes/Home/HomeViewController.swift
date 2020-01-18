//
//  HomeViewController.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStateHolderView: UIView!
    @IBOutlet private weak var retryButton: UIButton!

    private(set) var viewModel = HomeViewModel()
    private var router = DefaultHomeRouter()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addChangeHandler()
        applyStyling()
        configureViews()

        viewModel.fetchItemList()
    }
}

// MARK: - Styling

private extension HomeViewController {

    func applyStyling() {
        navigationController?.navigationBar.isHidden = true

        retryButton.applyStyle(for: .redWhite(isRoundedCorner: true))
        retryButton.setTitle("home_retry_button_label".localized, for: .normal)

        emptyStateHolderView.isHidden = true
        tableView.isHidden = false
    }
}

// MARK: - Configure Views

private extension HomeViewController {

    func configureViews() {
        tableView.dataSource = self
        tableView.delegate = self

        let cellIdentifier = String(describing: ItemCell.self)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - Actions

private extension HomeViewController {

    @IBAction func retryButtonTapped(_ sender: Any) {
        viewModel.fetchItemList()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: ItemCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }

        let item = viewModel.itemList[indexPath.row]
        let itemCellPresentation = ItemCellPresentation(category: item.category,
                                                        name: item.name,
                                                        price: item.price)
        cell.configure(with: itemCellPresentation)
        cell.delegate = self

        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedItemIndex = indexPath.row
        router.route(to: .itemDetail, from: self)
    }
}

// MARK: - ItemCellDelegate

extension HomeViewController: ItemCellDelegate {

    func itemCellDidTapBuyButton(_ cell: ItemCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }

        viewModel.selectedItemIndex = indexPath.row
        router.route(to: .itemDetail, from: self)
    }
}

// MARK: - State Change Handling

private extension HomeViewController {

    func addChangeHandler() {
        viewModel.addChangeHandler {
            self.handleStateChange($0)
        }
    }

    func handleStateChange(_ change: HomeStateChange) {
        switch change {
        case .loadingStateChanged(let isLoading):
            isLoading ? showLoading() : hideLoading()
        case .fetchItemListSuccess:
            emptyStateHolderView.isHidden = true
            tableView.reloadData()
        case .fetchItemListFailure:
            emptyStateHolderView.isHidden = false
            showAlert(withTitle: "general_network_error_title".localized,
                      message: "general_network_error_message".localized)
        }
    }
}
