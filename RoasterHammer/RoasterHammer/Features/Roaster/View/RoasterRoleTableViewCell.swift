//
//  RoasterRoleTableViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol RoasterRoleTableViewCellDelegate: class {
    func roasterRoleTableViewCellDidTapAddButton(_ sender: UIButton, atIndexPath indexPath: IndexPath)
}

final class RoasterRoleTableViewCell: UITableViewCell {
    private let cellLabel = UILabel(forAutoLayout: ())
    private let addButton = UIButton(forAutoLayout: ())
    private weak var delegate: RoasterRoleTableViewCellDelegate?
    private var indexPath: IndexPath?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cellLabel.textColor = UIColor.black
        contentView.addSubview(cellLabel)
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        contentView.addSubview(addButton)

        NSLayoutConstraint.activate([
            cellLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cellLabel.rightAnchor.constraint(equalTo: addButton.leftAnchor),
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            addButton.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithText(_ text: String, indexPath: IndexPath, delegate: RoasterRoleTableViewCellDelegate) {
        self.delegate = delegate
        self.indexPath = indexPath
        cellLabel.text = text
    }

    @objc private func addButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else {
            assertionFailure("The cell index path must be set")
            return
        }

        delegate?.roasterRoleTableViewCellDidTapAddButton(sender, atIndexPath: indexPath)
    }

}

