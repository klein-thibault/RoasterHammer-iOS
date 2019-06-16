//
//  CreateAccountRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class CreateAccountRouter {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func presentLoginView() {
        let loginView = RoasterHammerDependencyManager().loginBuilder().build()
        navigationController?.pushViewController(loginView, animated: true)
    }

    func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
