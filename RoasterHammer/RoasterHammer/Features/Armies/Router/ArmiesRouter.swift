//
//  ArmiesRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class ArmiesRouter {
    private unowned var dependencyManager: DependencyManager
    weak var navigationController: UINavigationController?

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    func presentDetachmentTypesView(armyId: Int, roaster: RoasterResponse) {
        let detachmentTypesView = dependencyManager.detachmentTypeBuilder().build(armyId: armyId, roaster: roaster)
        navigationController?.pushViewController(detachmentTypesView, animated: true)
    }
}
