//
//  RoasterSelectedDetachmentCollectionViewCell.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 5/3/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

final class RoasterSelectedDetachmentCollectionViewCell: RoasterSelectionBaseCollectionViewCell {
    private let detachmentHeaderView = DetachmentHeaderView(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)

        stackView.addArrangedSubview(detachmentHeaderView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithDetachment(_ detachment: DetachmentResponse) {
        detachmentHeaderView.setupWithDetachment(detachment)

        if detachment.army.rules.count > 0 {
            let rulesView = RulesView(forAutoLayout: ())
            rulesView.setupWithRules(detachment.army.rules)
            stackView.addArrangedSubview(rulesView)
        }
    }
}
