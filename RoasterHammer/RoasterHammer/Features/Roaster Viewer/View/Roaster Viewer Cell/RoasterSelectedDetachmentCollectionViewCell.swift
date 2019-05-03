//
//  RoasterSelectedDetachmentCollectionViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 5/3/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoasterSelectedDetachmentCollectionViewCell: UICollectionViewCell {
    private let scrollView = UIScrollView(forAutoLayout: ())
    private let stackView = UIStackView(forAutoLayout: ())
    private let detachmentNameLabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white

        detachmentNameLabel.textColor = UIColor.black

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.addArrangedSubview(detachmentNameLabel)
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

    func setupWithDetachment(_ detachment: DetachmentResponse) {
        detachmentNameLabel.text = detachment.name

        if detachment.army.rules.count > 0 {
            let rulesView = RulesView(forAutoLayout: ())
            rulesView.setupWithRules(detachment.army.rules)
            stackView.addArrangedSubview(rulesView)
        }
    }
}
