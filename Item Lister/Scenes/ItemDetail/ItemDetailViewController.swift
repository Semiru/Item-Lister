//
//  ItemDetailViewController.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 19.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

final class ItemDetailViewController: BaseViewController, StoryboardLoadable, Instantiatable {

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var buyButton: UIButton!
    @IBOutlet private weak var addToCartButton: UIButton!

    static var storyboardName: StoryboardName = .main

    var viewModel: ItemDetailViewModel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = false
    }
}

// MARK: - Styling

private extension ItemDetailViewController {

    func applyStyling() {
        title = "details_title".localized

        if let imageData = viewModel.imageData {
            itemImageView.image = UIImage(data: imageData)
        }

        let item = viewModel.item

        categoryLabel.textColor = .blackColor
        categoryLabel.font = UIFont.font(withFontType: .standard, size: 18.0)
        categoryLabel.text = item.category

        nameLabel.textColor = .blackColor
        nameLabel.font = UIFont.font(withFontType: .semibold, size: 18.0)
        nameLabel.text = item.name

        priceLabel.textColor = .blackColor
        priceLabel.font = UIFont.font(withFontType: .bold, size: 18.0)
        priceLabel.text = "\(item.price) \(Global.Constants.currencyCode)"

        buyButton.applyStyle(for: .redWhite(isRoundedCorner: false))
        buyButton.setTitle("general_buy_button_label".localized, for: .normal)

        addToCartButton.applyStyle(for: .blackWhite(isRoundedCorner: false))
        addToCartButton.setTitle("general_add_to_cart_button_label".localized, for: .normal)
    }
}

// MARK: - Actions

private extension ItemDetailViewController {

    @IBAction func addToCartButton(_ sender: Any) {
        // Left blank intentionally.
    }

    @IBAction func buyButtonTapped(_ sender: Any) {
        // Left blank intentionally.
    }
}
