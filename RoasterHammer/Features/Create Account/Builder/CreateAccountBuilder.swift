//
//  CreateAccountBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol CreateAccountBuildable {
    func build() -> UIViewController
    func buildDataStore() -> CreateAccountInteractor
}

final class CreateAccountBuilder: FeatureBuilderBase, CreateAccountBuildable {
    func build() -> UIViewController {
        let environmentManager = dependencyManager.environmentManager
        let dataManager = AccountDataManager(environmentManager: environmentManager)
        let interactor = CreateAccountInteractor(dataManager: dataManager)
        let presenter = CreateAccountPresenter()
        let view = CreateAccountViewController()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }

    func buildDataStore() -> CreateAccountInteractor {
        let environmentManager = dependencyManager.environmentManager
        let dataManager = AccountDataManager(environmentManager: environmentManager)
        let interactor = CreateAccountInteractor(dataManager: dataManager)

        return interactor
    }
}
