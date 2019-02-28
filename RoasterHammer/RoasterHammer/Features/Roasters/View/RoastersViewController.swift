//
//  RoastersViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class RoastersViewController: RoastersLayoutViewController {
    var interactor: RoastersViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        let accountButton = UIBarButtonItem(title: "Profile",
                                            style: .plain,
                                            target: self,
                                            action: #selector(accountButtonTapped(_:)))
        let addRoasterButton = UIBarButtonItem(barButtonSystemItem: .add,
                                               target: self,
                                               action: #selector(addRoasterButtonTapped(_:)))
        navigationItem.leftBarButtonItem = accountButton
        navigationItem.rightBarButtonItem = addRoasterButton
    }

    @objc private func accountButtonTapped(_ sender: UIBarButtonItem) {
        interactor.accountButtonTapped()
    }

    @objc private func addRoasterButtonTapped(_ sender: UIBarButtonItem) {
        interactor.addRoasterButtonTapped()
    }

}

extension RoastersViewController: RoastersView {
    func presentLoginView() {
        let router = RoastersRouter(navigationController: navigationController)
        router.presentLoginView()
    }
}
