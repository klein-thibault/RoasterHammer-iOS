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

final class RoasterSelectedModelCollectionViewCell: RoasterSelectionBaseCollectionViewCell {
    private let unitHeaderView = UnitHeaderView(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        stackView.addArrangedSubview(unitHeaderView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

