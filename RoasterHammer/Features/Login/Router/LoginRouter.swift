//
//  LoginRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class LoginRouter {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func presentCreateAccountView() {
        let createAccountView = RoasterHammerDependencyManager().createAccountBuilder().build()
        navigationController?.pushViewController(createAccountView, animated: true)
    }

    func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

}
