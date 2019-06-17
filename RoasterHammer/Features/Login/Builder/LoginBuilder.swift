//
//  LoginBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol LoginBuildable {
    func build() -> UIViewController
    func buildInNavigationController() -> UINavigationController
    func buildDataStore() -> LoginInteractor
}

final class LoginBuilder: FeatureBuilderBase, LoginBuildable {
    func build() -> UIViewController {
        let environmentManager = dependencyManager.environmentManager
        let dataManager = AccountDataManager(environmentManager: environmentManager)
        let interactor = LoginInteractor(dataManager: dataManager)
        let presenter = LoginPresenter()
        let view = LoginViewController()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }

    func buildInNavigationController() -> UINavigationController {
        let view = build()
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }

    func buildDataStore() -> LoginInteractor {
        let environmentManager = dependencyManager.environmentManager
        let dataManager = AccountDataManager(environmentManager: environmentManager)
        let interactor = LoginInteractor(dataManager: dataManager)

        return interactor
    }
}
