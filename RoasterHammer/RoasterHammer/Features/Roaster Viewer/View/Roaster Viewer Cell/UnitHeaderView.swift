//
//  UnitHeaderView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class UnitHeaderView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())
    private let nameLabel = UILabel(forAutoLayout: ())
    private let costLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        nameLabel.textColor = UIColor.black
        costLabel.textColor = UIColor.black
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5.0
        stackView.addArrangedSubview(costLabel)
        stackView.addArrangedSubview(nameLabel)

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

    func setupWithUnit(_ selectedUnit: SelectedUnitResponse) {
        nameLabel.text = selectedUnit.unit.name
        costLabel.text = "\(selectedUnit.cost) points"
    }
}
