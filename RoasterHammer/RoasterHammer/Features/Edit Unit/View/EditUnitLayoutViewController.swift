//
//  EditUnitLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class EditUnitLayoutViewController: BaseViewController {
    let temporaryLabel = UILabel(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        temporaryLabel.text = "Edit Unit View"
        view.addSubview(temporaryLabel)

        NSLayoutConstraint.activate([
            temporaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temporaryLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
}
