//
//  RoasterRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoasterRouter {
    private unowned var dependencyManager: DependencyManager
    weak var navigationController: UINavigationController?

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    func presentArmySelection(roaster: RoasterResponse) {
        let armiesViewController = dependencyManager.armiesBuilder().build(roaster: roaster)
        navigationController?.pushViewController(armiesViewController, animated: true)
    }
}
