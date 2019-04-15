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
        let armiesViewController = dependencyManager.armiesBuilder().buildInNavigationController(roaster: roaster)
        navigationController?.present(armiesViewController, animated: true, completion: nil)
    }

    func presentUnitsView(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) {
        let unitsView = dependencyManager.unitsBuilder().buildInNavigationController(filters: filters,
                                                                                     detachmentId: detachmentId,
                                                                                     unitRoleId: unitRoleId)
        navigationController?.present(unitsView, animated: true, completion: nil)
    }

    func presentEditUnitView(detachment: DetachmentResponse, unit: SelectedUnitResponse) {
        let editUnitView = dependencyManager.editUnitBuilder().build(detachment: detachment, unit: unit)
        navigationController?.pushViewController(editUnitView, animated: true)
    }
}
