//
//  TableViewHeaderLabel.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/8/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class TableViewHeaderLabel: UIView {
    private let label = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.gray
        label.textColor = UIColor.black
        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithTitle(_ title: String) {
        label.text = title
    }
}
