//
//  RoasterSelectedModelCollectionViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoasterSelectedModelCollectionViewCell: UICollectionViewCell {
    private let scrollView = UIScrollView(forAutoLayout: ())
    private let stackView = UIStackView(forAutoLayout: ())
    private let unitHeaderView = UnitHeaderView(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.addArrangedSubview(unitHeaderView)
        scrollView.addSubview(stackView)

        contentView.addSubview(scrollView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        let arrangedSubviews = stackView.arrangedSubviews

        for index in 1...arrangedSubviews.count - 1 {
            arrangedSubviews[index].removeFromSuperview()
        }
    }

    func setupWithUnit(_ selectedUnit: SelectedUnitResponse) {
        unitHeaderView.setupWithUnit(selectedUnit)

        for model in selectedUnit.models {
            let modelCharacteristicsView = ModelCharacteristicsView(forAutoLayout: ())
            stackView.addArrangedSubview(modelCharacteristicsView)
            modelCharacteristicsView.setupWithModel(model)

            for weapon in model.selectedWeapons {
                let weaponCharacteristicsView = WeaponCharacteristicsView(forAutoLayout: ())
                stackView.addArrangedSubview(weaponCharacteristicsView)
                weaponCharacteristicsView.setupWithWeapon(weapon)
            }
        }

        if selectedUnit.unit.rules.count > 0 {
            let rulesView = RulesView(forAutoLayout: ())
            rulesView.setupWithRules(selectedUnit.unit.rules)
            stackView.addArrangedSubview(rulesView)
        }

        // Bottom spacing view
        stackView.addArrangedSubview(UIView(forAutoLayout: ()))
    }
}

