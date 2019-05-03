//
//  WeaponCharacteristicsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

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
        nameLabel.numberOfLines = 2
        rangeLabel.textColor = UIColor.black
        typeLabel.textColor = UIColor.black
        typeLabel.numberOfLines = 2
        strengthLabel.textColor = UIColor.black
        armorPiercingLabel.textColor = UIColor.black
        damageLabel.textColor = UIColor.black
        abilityLabel.textColor = UIColor.black
        abilityLabel.numberOfLines = 0

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
