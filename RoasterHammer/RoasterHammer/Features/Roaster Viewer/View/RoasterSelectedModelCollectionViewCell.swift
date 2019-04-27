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
    private let stackView = UIStackView(forAutoLayout: ())
    private let unitHeaderView = UnitHeaderView(forAutoLayout: ())
    // TODO: handle multiple models in the unit
    private let modelCharacteristicsView = ModelCharacteristicsView(forAutoLayout: ())
    // TODO: handle multiple weapons
    private let weaponCharacteristicsView = WeaponCharacteristicsView(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        stackView.axis = .vertical
        stackView.spacing = 15.0
        stackView.addArrangedSubview(unitHeaderView)
        stackView.addArrangedSubview(modelCharacteristicsView)
        stackView.addArrangedSubview(weaponCharacteristicsView)
        stackView.addArrangedSubview(UIView(forAutoLayout: ()))
        contentView.addSubview(stackView)

        backgroundColor = UIColor.lightGray

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

    func setupWithUnit(_ selectedUnit: SelectedUnitResponse) {
        unitHeaderView.setupWithUnit(selectedUnit)

        if let model = selectedUnit.models.first {
            modelCharacteristicsView.setupWithModel(model)

            if let weapon = model.selectedWeapons.first {
                weaponCharacteristicsView.setupWithWeapon(weapon)
            }
        }
    }
}

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

final class ModelCharacteristicsView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())

    private let characteristicsHeaderStackView = UIStackView(forAutoLayout: ())
    private let characteristicsValueStackView = UIStackView(forAutoLayout: ())

    private let movementHeaderLabel = UILabel(forAutoLayout: ())
    private let movementLabel = UILabel(forAutoLayout: ())
    private let weaponSkillHeaderLabel = UILabel(forAutoLayout: ())
    private let weaponSkillLabel = UILabel(forAutoLayout: ())
    private let balisticSkillHeaderLabel = UILabel(forAutoLayout: ())
    private let balisticSkillLabel = UILabel(forAutoLayout: ())
    private let strengthHeaderLabel = UILabel(forAutoLayout: ())
    private let strengthLabel = UILabel(forAutoLayout: ())
    private let toughnessHeaderLabel = UILabel(forAutoLayout: ())
    private let toughnessLabel = UILabel(forAutoLayout: ())
    private let woundsHeaderLabel = UILabel(forAutoLayout: ())
    private let woundsLabel = UILabel(forAutoLayout: ())
    private let attacksHeaderLabel = UILabel(forAutoLayout: ())
    private let attacksLabel = UILabel(forAutoLayout: ())
    private let leadershipHeaderLabel = UILabel(forAutoLayout: ())
    private let leadershipLabel = UILabel(forAutoLayout: ())
    private let saveHeaderLabel = UILabel(forAutoLayout: ())
    private let saveLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        movementHeaderLabel.textColor = UIColor.black
        weaponSkillHeaderLabel.textColor = UIColor.black
        balisticSkillHeaderLabel.textColor = UIColor.black
        strengthHeaderLabel.textColor = UIColor.black
        toughnessHeaderLabel.textColor = UIColor.black
        woundsHeaderLabel.textColor = UIColor.black
        attacksHeaderLabel.textColor = UIColor.black
        leadershipHeaderLabel.textColor = UIColor.black
        saveHeaderLabel.textColor = UIColor.black

        movementLabel.textColor = UIColor.black
        weaponSkillLabel.textColor = UIColor.black
        balisticSkillLabel.textColor = UIColor.black
        strengthLabel.textColor = UIColor.black
        toughnessLabel.textColor = UIColor.black
        woundsLabel.textColor = UIColor.black
        attacksLabel.textColor = UIColor.black
        leadershipLabel.textColor = UIColor.black
        saveLabel.textColor = UIColor.black

        movementHeaderLabel.text = "M"
        weaponSkillHeaderLabel.text = "WS"
        balisticSkillHeaderLabel.text = "BS"
        strengthHeaderLabel.text = "S"
        toughnessHeaderLabel.text = "T"
        woundsHeaderLabel.text = "W"
        attacksHeaderLabel.text = "A"
        leadershipHeaderLabel.text = "Ld"
        saveHeaderLabel.text = "Sv"

        characteristicsHeaderStackView.axis = .horizontal
        characteristicsHeaderStackView.alignment = .fill
        characteristicsHeaderStackView.distribution = .fillEqually
        characteristicsHeaderStackView.addArrangedSubview(movementHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(weaponSkillHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(balisticSkillHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(strengthHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(toughnessHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(woundsHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(attacksHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(leadershipHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(saveHeaderLabel)

        characteristicsValueStackView.axis = .horizontal
        characteristicsValueStackView.alignment = .fill
        characteristicsValueStackView.distribution = .fillEqually
        characteristicsValueStackView.addArrangedSubview(movementLabel)
        characteristicsValueStackView.addArrangedSubview(weaponSkillLabel)
        characteristicsValueStackView.addArrangedSubview(balisticSkillLabel)
        characteristicsValueStackView.addArrangedSubview(strengthLabel)
        characteristicsValueStackView.addArrangedSubview(toughnessLabel)
        characteristicsValueStackView.addArrangedSubview(woundsLabel)
        characteristicsValueStackView.addArrangedSubview(attacksLabel)
        characteristicsValueStackView.addArrangedSubview(leadershipLabel)
        characteristicsValueStackView.addArrangedSubview(saveLabel)

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5.0
        characteristicsHeaderStackView.distribution = .fillEqually
        stackView.addArrangedSubview(characteristicsHeaderStackView)
        stackView.addArrangedSubview(characteristicsValueStackView)

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

    func setupWithModel(_ selectedModel: SelectedModelResponse) {
        movementLabel.text = selectedModel.model.characteristics.movement
        weaponSkillLabel.text = selectedModel.model.characteristics.weaponSkill
        balisticSkillLabel.text = selectedModel.model.characteristics.balisticSkill
        strengthLabel.text = selectedModel.model.characteristics.strength
        toughnessLabel.text = selectedModel.model.characteristics.toughness
        woundsLabel.text = selectedModel.model.characteristics.wounds
        attacksLabel.text = selectedModel.model.characteristics.attacks
        leadershipLabel.text = selectedModel.model.characteristics.leadership
        saveLabel.text = selectedModel.model.characteristics.save
    }
}

final class WeaponCharacteristicsView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())

    private let characteristicsHeaderStackView = UIStackView(forAutoLayout: ())
    private let characteristicsValueStackView = UIStackView(forAutoLayout: ())

    private let nameHeaderLabel = UILabel(forAutoLayout: ())
    private let nameLabel = UILabel(forAutoLayout: ())
    private let rangeHeaderLabel = UILabel(forAutoLayout: ())
    private let rangeLabel = UILabel(forAutoLayout: ())
    private let typeHeaderLabel = UILabel(forAutoLayout: ())
    private let typeLabel = UILabel(forAutoLayout: ())
    private let strengthHeaderLabel = UILabel(forAutoLayout: ())
    private let strengthLabel = UILabel(forAutoLayout: ())
    private let armorPiercingHeaderLabel = UILabel(forAutoLayout: ())
    private let armorPiercingLabel = UILabel(forAutoLayout: ())
    private let damageHeaderLabel = UILabel(forAutoLayout: ())
    private let damageLabel = UILabel(forAutoLayout: ())
    private let abilityHeaderLabel = UILabel(forAutoLayout: ())
    private let abilityLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        nameHeaderLabel.textColor = UIColor.black
        rangeHeaderLabel.textColor = UIColor.black
        typeHeaderLabel.textColor = UIColor.black
        strengthHeaderLabel.textColor = UIColor.black
        armorPiercingHeaderLabel.textColor = UIColor.black
        damageHeaderLabel.textColor = UIColor.black
        abilityHeaderLabel.textColor = UIColor.black

        nameLabel.textColor = UIColor.black
        rangeLabel.textColor = UIColor.black
        typeLabel.textColor = UIColor.black
        strengthLabel.textColor = UIColor.black
        armorPiercingLabel.textColor = UIColor.black
        damageLabel.textColor = UIColor.black
        abilityLabel.textColor = UIColor.black

        nameHeaderLabel.text = "Name"
        rangeHeaderLabel.text = "Range"
        typeHeaderLabel.text = "Type"
        strengthHeaderLabel.text = "S"
        armorPiercingHeaderLabel.text = "AP"
        damageHeaderLabel.text = "D"
        abilityHeaderLabel.text = "Ability"

        characteristicsHeaderStackView.axis = .horizontal
        characteristicsHeaderStackView.alignment = .fill
        characteristicsHeaderStackView.distribution = .fillEqually
        characteristicsHeaderStackView.addArrangedSubview(nameHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(rangeHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(typeHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(strengthHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(armorPiercingHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(damageHeaderLabel)
        characteristicsHeaderStackView.addArrangedSubview(abilityHeaderLabel)

        characteristicsValueStackView.axis = .horizontal
        characteristicsValueStackView.alignment = .fill
        characteristicsValueStackView.distribution = .fillEqually
        characteristicsValueStackView.addArrangedSubview(nameLabel)
        characteristicsValueStackView.addArrangedSubview(rangeLabel)
        characteristicsValueStackView.addArrangedSubview(typeLabel)
        characteristicsValueStackView.addArrangedSubview(strengthLabel)
        characteristicsValueStackView.addArrangedSubview(armorPiercingLabel)
        characteristicsValueStackView.addArrangedSubview(damageLabel)
        characteristicsValueStackView.addArrangedSubview(abilityLabel)

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5.0
        characteristicsHeaderStackView.distribution = .fillEqually
        stackView.addArrangedSubview(characteristicsHeaderStackView)
        stackView.addArrangedSubview(characteristicsValueStackView)

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

    func setupWithWeapon(_ weapon: WeaponResponse) {
        nameLabel.text = weapon.name
        rangeLabel.text = weapon.range
        typeLabel.text = weapon.type
        strengthLabel.text = weapon.strength
        armorPiercingLabel.text = weapon.armorPiercing
        damageLabel.text = weapon.damage
        abilityLabel.text = weapon.ability
    }
}
