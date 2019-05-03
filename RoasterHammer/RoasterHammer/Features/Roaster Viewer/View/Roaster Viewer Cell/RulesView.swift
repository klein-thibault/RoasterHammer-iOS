//
//  UnitRulesView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 5/3/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RulesView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())
    private let ruleViewHeaderLabel = UILabel(forAutoLayout: ())

    private let rulesHeaderStackView = UIStackView(forAutoLayout: ())

    private let ruleNameHeaderLabel = UILabel(forAutoLayout: ())
    private let ruleDescriptionHeaderLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        ruleViewHeaderLabel.textColor = UIColor.black
        ruleViewHeaderLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        ruleViewHeaderLabel.text = "Rules"

        ruleNameHeaderLabel.textColor = UIColor.black
        ruleDescriptionHeaderLabel.textColor = UIColor.black

        ruleNameHeaderLabel.text = "Name"
        ruleDescriptionHeaderLabel.text = "Description"

        rulesHeaderStackView.axis = .horizontal
        rulesHeaderStackView.alignment = .fill
        rulesHeaderStackView.distribution = .fill
        rulesHeaderStackView.spacing = 5.0
        rulesHeaderStackView.addArrangedSubview(ruleNameHeaderLabel)
        rulesHeaderStackView.addArrangedSubview(ruleDescriptionHeaderLabel)

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.addArrangedSubview(ruleViewHeaderLabel)
        stackView.addArrangedSubview(rulesHeaderStackView)

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

    func setupWithRules(_ rules: [RuleResponse]) {
        ruleNameHeaderLabel.widthAnchor.constraint(equalToConstant: 75.0).isActive = true

        for rule in rules {
            let ruleStackView = UIStackView(forAutoLayout: ())
            let ruleNameLabel = UILabel(forAutoLayout: ())
            let ruleDescriptionLabel = UILabel(forAutoLayout: ())

            ruleNameLabel.widthAnchor.constraint(equalToConstant: 75.0).isActive = true

            ruleNameLabel.textColor = UIColor.black
            ruleNameLabel.text = rule.name
            ruleNameLabel.numberOfLines = 0
            ruleDescriptionLabel.textColor = UIColor.black
            ruleDescriptionLabel.text = rule.description
            ruleDescriptionLabel.numberOfLines = 0

            ruleStackView.axis = .horizontal
            ruleStackView.alignment = .fill
            ruleStackView.distribution = .fill
            ruleStackView.spacing = 10.0
            ruleStackView.addArrangedSubview(ruleNameLabel)
            ruleStackView.addArrangedSubview(ruleDescriptionLabel)

            stackView.addArrangedSubview(ruleStackView)
        }
    }
}
