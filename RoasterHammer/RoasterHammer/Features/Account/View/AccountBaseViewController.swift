//
//  AccountBaseViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class AccountBaseViewController: BaseViewController {
    let label = UILabel(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Account"

        label.text = "Account Page"
        label.textColor = UIColor.black
        view.backgroundColor = UIColor.white

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

}
