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

final class UnitRulesView: UIView {
    private let stackView = UIStackView(forAutoLayout: ())
    private let unitRuleViewHeaderLabel = UILabel(forAutoLayout: ())

    private let rulesHeaderStackView = UIStackView(forAutoLayout: ())

    private let ruleNameHeaderLabel = UILabel(forAutoLayout: ())
    private let ruleDescriptionHeaderLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        unitRuleViewHeaderLabel.textColor = UIColor.black
        unitRuleViewHeaderLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        unitRuleViewHeaderLabel.text = "Rules"

        ruleNameHeaderLabel.textColor = UIColor.black
        ruleDescriptionHeaderLabel.textColor = UIColor.black

        ruleNameHeaderLabel.text = "Name"
        ruleDescriptionHeaderLabel.text = "Description"

        rulesHeaderStackView.axis = .horizontal
        rulesHeaderStackView.alignment = .fill
        rulesHeaderStackView.distribution = .fillEqually
        rulesHeaderStackView.addArrangedSubview(ruleNameHeaderLabel)
        rulesHeaderStackView.addArrangedSubview(ruleDescriptionHeaderLabel)

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5.0
        stackView.addArrangedSubview(unitRuleViewHeaderLabel)
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
        for rule in rules {
            let ruleStackView = UIStackView(forAutoLayout: ())
            let ruleNameLabel = UILabel(forAutoLayout: ())
            let ruleDescriptionLabel = UILabel(forAutoLayout: ())

            ruleNameLabel.textColor = UIColor.black
            ruleNameLabel.text = rule.name
            ruleDescriptionLabel.textColor = UIColor.black
            ruleDescriptionLabel.text = rule.description

            ruleStackView.axis = .horizontal
            ruleStackView.alignment = .fill
            ruleStackView.distribution = .fillEqually
            ruleStackView.addArrangedSubview(ruleNameLabel)
            ruleStackView.addArrangedSubview(ruleDescriptionLabel)

            stackView.addArrangedSubview(ruleStackView)
        }
    }
}
