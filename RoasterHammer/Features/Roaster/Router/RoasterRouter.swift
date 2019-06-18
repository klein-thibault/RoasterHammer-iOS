//
//  RoasterRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

final class RoasterRouter {
    private unowned var dependencyManager: DependencyManager
    weak var navigationController: UINavigationController?

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    func presentArmySelection(roaster: RoasterResponse) {
//        let armiesViewController = dependencyManager.armiesBuilder().buildInNavigationController(roaster: roaster)
//        navigationController?.present(armiesViewController, animated: true, completion: nil)
    }

    func presentUnitsView(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) {
//        let unitsView = dependencyManager.unitsBuilder().buildInNavigationController(filters: filters,
//                                                                                     detachmentId: detachmentId,
//                                                                                     unitRoleId: unitRoleId)
//        navigationController?.present(unitsView, animated: true, completion: nil)
    }

    func presentEditUnitView(detachment: DetachmentResponse,
                             unit: SelectedUnitResponse,
                             delegate: RoasterDetachmentUpdateDelegate?) {
        let editUnitView = dependencyManager.editUnitBuilder().build(detachment: detachment,
                                                                     selectedUnit: unit,
                                                                     delegate: delegate)
        navigationController?.pushViewController(editUnitView, animated: true)
    }

    func presentRoasterViewer(roaster: RoasterResponse) {
        let roasterViewer = dependencyManager.roasterViewerBuilder().buildWithNavigationController(roaster: roaster)
        navigationController?.present(roasterViewer, animated: true, completion: nil)
    }
}
