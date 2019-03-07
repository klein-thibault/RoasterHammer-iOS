//
//  AccountViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class AccountViewController: AccountBaseViewController {
    var interactor: AccountViewOutput!
    var router: AccountRouter!

    override func viewDidLoad() {
        super.viewDidLoad()

        router.navigationController = navigationController

        let closeButton = UIBarButtonItem(title: "Close",
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped(_:)))
        navigationItem.rightBarButtonItem = closeButton
    }

    @objc private func closeButtonTapped(_ sender: UIBarButtonItem) {
        router.dismiss()
    }
}

extension AccountViewController: AccountView {

}
