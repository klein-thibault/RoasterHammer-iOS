//
//  RoastersLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class RoastersLayoutViewController: BaseViewController {

    let label = UILabel(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        label.textColor = UIColor.black
        label.text = "Roasters"

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

}
