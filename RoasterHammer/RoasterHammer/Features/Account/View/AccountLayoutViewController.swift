//
//  AccountBaseViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class AccountLayoutViewController: BaseViewController {
    let label = UILabel(forAutoLayout: ())
    let logoutButton = UIButton(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Account"

        label.text = "Account Page"
        label.textColor = UIColor.black
        view.backgroundColor = UIColor.white

        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(UIColor.red, for: .normal)

        view.addSubview(label)
        view.addSubview(logoutButton)

        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            logoutButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 120.0),
            logoutButton.heightAnchor.constraint(equalToConstant: 44.0)
            ])
    }

}
