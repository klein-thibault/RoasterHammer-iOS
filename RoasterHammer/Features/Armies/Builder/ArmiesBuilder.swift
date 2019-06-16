//
//  ArmiesBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol ArmiesBuildable {
    func build(roaster: RoasterResponse) -> UIViewController
    func buildInNavigationController(roaster: RoasterResponse) -> UINavigationController
}

final class ArmiesBuilder: FeatureBuilderBase, ArmiesBuildable {
    func build(roaster: RoasterResponse) -> UIViewController {
        return createStack(roaster: roaster)
    }

    func buildInNavigationController(roaster: RoasterResponse) -> UINavigationController {
        let view = createStack(roaster: roaster, isPresentedModally: true)
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }

    private func createStack(roaster: RoasterResponse, isPresentedModally: Bool = false) -> ArmiesViewController {
        let armyDataManager = ArmyDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = ArmiesInteractor(armyDataManager: armyDataManager)
        let presenter = ArmiesPresenter()
        let view = ArmiesViewController(roaster: roaster, isPresentedModally: isPresentedModally)
        let router = ArmiesRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
