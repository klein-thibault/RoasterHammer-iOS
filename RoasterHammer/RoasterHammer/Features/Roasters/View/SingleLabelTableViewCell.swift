//
//  RoasterTableViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class SingleLabelTableViewCell: UITableViewCell {
    private let cellSingleLabel = UILabel(forAutoLayout: ())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cellSingleLabel.textColor = UIColor.black
        contentView.addSubview(cellSingleLabel)

        NSLayoutConstraint.activate([
            cellSingleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cellSingleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellSingleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellSingleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithText(_ text: String) {
        cellSingleLabel.text = text
    }

}
