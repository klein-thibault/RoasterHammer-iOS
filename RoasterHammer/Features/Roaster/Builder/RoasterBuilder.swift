//
//  RoasterBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol RoasterBuildable {
    func build(roaster: RoasterResponse) -> UIViewController
}

final class RoasterBuilder: FeatureBuilderBase, RoasterBuildable {
    func build(roaster: RoasterResponse) -> UIViewController {
        let roasterDataManager = RoasterDataManager(environmentManager: dependencyManager.environmentManager)
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = RoasterInteractor(roasterDataManager: roasterDataManager,
                                           unitDataManager: unitDataManager,
                                           roaster: roaster)
        let presenter = RoasterPresenter()
        let view = RoasterViewController(roaster: roaster)
        let router = RoasterRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
