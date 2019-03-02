//
//  RoastersBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol RoastersBuildable {
    func build() -> UIViewController
}

final class RoastersBuilder: FeatureBuilderBase, RoastersBuildable {
    func build() -> UIViewController {
        let environmentManager = dependencyManager.environmentManager
        let accountDataManager = AccountDataManager(environmentManager: environmentManager)
        let roastersDataManager = RoasterDataManager(environmentManager: environmentManager)
        let interactor = RoastersInteractor(accountDataManager: accountDataManager, roastersDataManager: roastersDataManager)
        let presenter = RoastersPresenter()
        let view = RoastersViewController()
        let router = RoastersRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
