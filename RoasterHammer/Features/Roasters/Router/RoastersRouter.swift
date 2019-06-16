//
//  RoastersRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

final class RoastersRouter {
    private unowned var dependencyManager: DependencyManager
    weak var navigationController: UINavigationController?

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    func presentLoginView() {
        let loginView = dependencyManager.loginBuilder().buildInNavigationController()
        navigationController?.present(loginView, animated: true, completion: nil)
    }

    func presentAccountView() {
        let accountView = dependencyManager.accountBuilder().buildWithNavigationController()
        navigationController?.present(accountView, animated: true, completion: nil)
    }

    func presentRoasterView(roaster: RoasterResponse) {
        let roasterView = dependencyManager.roasterBuilder().build(roaster: roaster)
        navigationController?.pushViewController(roasterView, animated: true)
    }
}
