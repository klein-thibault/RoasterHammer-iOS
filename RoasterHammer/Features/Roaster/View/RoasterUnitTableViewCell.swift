//
//  RoasterUnitTableViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol RoasterUnitTableViewCellDelegate: class {
    func roasterUnitTableViewCellDidTapEditButton(_ sender: UIButton,
                                                  atIndexPath indexPath: IndexPath)
}

final class RoasterUnitTableViewCell: UITableViewCell {
    private let unitNameLabel = UILabel(forAutoLayout: ())
    private let editButton = UIButton(forAutoLayout: ())
    private weak var delegate: RoasterUnitTableViewCellDelegate?
    private var indexPath: IndexPath?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        unitNameLabel.textColor = UIColor.black
        contentView.addSubview(unitNameLabel)

        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(UIColor.black, for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
        contentView.addSubview(editButton)

        NSLayoutConstraint.activate([
            unitNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            unitNameLabel.rightAnchor.constraint(equalTo: editButton.leftAnchor),
            unitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            unitNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            editButton.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 50)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithUnitName(_ unitName: String,
                           indexPath: IndexPath,
                           delegate: RoasterUnitTableViewCellDelegate) {
        self.delegate = delegate
        self.indexPath = indexPath
        unitNameLabel.text = unitName
    }

    @objc private func editButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else {
            assertionFailure("The cell index path must be set")
            return
        }

        delegate?.roasterUnitTableViewCellDidTapEditButton(sender, atIndexPath: indexPath)
    }
}
