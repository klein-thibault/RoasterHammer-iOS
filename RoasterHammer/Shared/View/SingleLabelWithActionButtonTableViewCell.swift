//
//  SingleLabelWithActionButtonTableViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol SingleLabelWithActionButtonTableViewCellDelegate: class {
    func singleLabelCellActionButtonTapped(_ sender: UIButton, atIndexPath indexPath: IndexPath)
}

final class SingleLabelWithActionButtonTableViewCell: UITableViewCell {
    private let cellSingleLabel = UILabel(forAutoLayout: ())
    private let actionButton = UIButton(forAutoLayout: ())
    private let stackView = UIStackView(forAutoLayout: ())
    private var indexPath: IndexPath!
    private weak var delegate: SingleLabelWithActionButtonTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cellSingleLabel.textColor = UIColor.black
        actionButton.setTitleColor(UIColor.black, for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped(_:)), for: .touchUpInside)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.addArrangedSubview(cellSingleLabel)
        stackView.addArrangedSubview(actionButton)

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Functions

    func setupWithTitle(_ title: String,
                        actionButtonTitle: String,
                        indexPath: IndexPath,
                        delegate: SingleLabelWithActionButtonTableViewCellDelegate) {
        cellSingleLabel.text = title
        actionButton.setTitle(actionButtonTitle, for: .normal)
        self.indexPath = indexPath
        self.delegate = delegate
    }

    // MARK: - Private Functions

    @objc private func actionButtonTapped(_ sender: UIButton) {
        delegate?.singleLabelCellActionButtonTapped(sender, atIndexPath: indexPath)
    }
}
