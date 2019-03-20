//
//  UnitsBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

protocol UnitsBuildable {
    func build(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) -> UIViewController
    func buildInNavigationController(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) -> UINavigationController
}

final class UnitsBuilder: FeatureBuilderBase, UnitsBuildable {
    func build(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) -> UIViewController {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = UnitsInteractor(unitDataManager: unitDataManager,
                                         filters: filters,
                                         detachmentId: detachmentId,
                                         unitRoleId: unitRoleId)
        let presenter = UnitsPresenter()
        let view = UnitsViewController()
        let router = UnitsRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }

    func buildInNavigationController(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) -> UINavigationController {
        let view = build(filters: filters, detachmentId: detachmentId, unitRoleId: unitRoleId)
        let navigationController = UINavigationController(rootViewController: view)

        return navigationController
    }
}
