//
//  RoastersRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class RoastersRouter {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func presentLoginView() {
        let loginViewController = RoasterHammerDependencyManager().loginBuilder().buildInNavigationController()
        navigationController?.present(loginViewController, animated: true, completion: nil)
    }
}
