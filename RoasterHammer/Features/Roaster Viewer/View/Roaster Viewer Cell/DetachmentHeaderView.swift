//
//  DetachmentHeaderView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 5/3/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

final class DetachmentHeaderView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())
    private let nameLabel = UILabel(forAutoLayout: ())
    private let costLabel = UILabel(forAutoLayout: ())
    private let commandPointsLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        nameLabel.textColor = UIColor.black
        costLabel.textColor = UIColor.black
        commandPointsLabel.textColor = UIColor.black
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5.0
        stackView.addArrangedSubview(costLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(commandPointsLabel)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithDetachment(_ detachment: DetachmentResponse) {
        nameLabel.text = detachment.name
        costLabel.text = "\(detachment.totalCost) points"
        commandPointsLabel.text = "\(detachment.commandPoints) CPs"
    }
}
