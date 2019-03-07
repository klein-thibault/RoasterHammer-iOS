//
//  AccountBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol AccountBuildable {
    func build() -> UIViewController
    func buildWithNavigationController() -> UINavigationController
}

final class AccountBuilder: FeatureBuilderBase, AccountBuildable {
    func build() -> UIViewController {
        let accountDataManager = AccountDataManager(environmentManager: dependencyManager.environmentManager)
        let gameDataManager = GameDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = AccountInteractor(accountDataManager: accountDataManager, gameDataManager: gameDataManager)
        let presenter = AccountPresenter()
        let view = AccountViewController()
        let router = AccountRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }

    func buildWithNavigationController() -> UINavigationController {
        let view = build()
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}
