//
//  ItemCell.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import UIKit

struct ItemCellPresentation {

    let category: String
    let name: String
    let price: String
}

protocol ItemCellDelegate: class {

    func itemCellDidTapBuyButton(_ cell: ItemCell)
}

final class ItemCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var buyButton: UIButton!

    weak var delegate: ItemCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        applyStyling()
    }
}

// MARK: - Styling

private extension ItemCell {

    func applyStyling() {
        selectionStyle = .none

        categoryLabel.textColor = .blackColor
        categoryLabel.font = UIFont.font(withFontType: .standard, size: 18.0)

        nameLabel.textColor = .blackColor
        nameLabel.font = UIFont.font(withFontType: .semibold, size: 18.0)

        priceLabel.textColor = .blackColor
        priceLabel.font = UIFont.font(withFontType: .bold, size: 18.0)

        buyButton.applyStyle(for: .redWhite(isRoundedCorner: true))
        buyButton.setTitle("general_buy_button_label".localized, for: .normal)
    }
}

// MARK: Actions

private extension ItemCell {

    @IBAction func buyButtonTapped(_ sender: Any) {
        delegate?.itemCellDidTapBuyButton(self)
    }
}

// MARK: - Configuration

extension ItemCell {

    func configure(with presentation: ItemCellPresentation) {
        categoryLabel.text = presentation.category
        nameLabel.text = presentation.name
        priceLabel.text = "\(presentation.price) \(Global.Constants.currencyCode)"
    }

    func configure(with imageData: Data) {
        iconImageView.image = UIImage(data: imageData)
    }
}
