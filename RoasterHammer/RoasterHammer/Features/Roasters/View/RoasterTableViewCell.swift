//
//  RoasterTableViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoasterTableViewCell: UITableViewCell {
    var roasterNameLabel = UILabel(forAutoLayout: ())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        roasterNameLabel.textColor = UIColor.black
        contentView.addSubview(roasterNameLabel)

        NSLayoutConstraint.activate([
            roasterNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            roasterNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            roasterNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            roasterNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithRoaster(roaster: RoasterResponse) {
        roasterNameLabel.text = roaster.name
    }

}
