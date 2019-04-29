//
//  ModelCharacteristicsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class ModelCharacteristicsView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())

    private let modelNameLabel = UILabel(forAutoLayout: ())

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

        modelNameLabel.textColor = UIColor.black
        modelNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)

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
        stackView.addArrangedSubview(modelNameLabel)
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
        modelNameLabel.text = selectedModel.model.name
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
